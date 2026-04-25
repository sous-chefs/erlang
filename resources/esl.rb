# frozen_string_literal: true

provides :erlang_esl
unified_mode true

property :package_name, String, default: 'esl-erlang'
property :version, [String, nil]
property :lsb_codename, String, default: lazy { node.dig('lsb', 'codename') || node['platform_version'] }
property :apt_repo_uri, String, default: 'https://packages.erlang-solutions.com/debian/'
property :apt_repo_key, String, default: 'https://packages.erlang-solutions.com/debian/erlang_solutions.asc'
property :yum_repo_baseurl, String, default: 'https://packages.erlang-solutions.com/rpm/centos/$releasever/$basearch'
property :yum_repo_gpgkey, String, default: 'https://packages.erlang-solutions.com/debian/erlang_solutions.asc'
property :install_epel_repository, [true, false], default: true

default_action :install

action :install do
  case node['platform_family']
  when 'debian'
    apt_update 'update' do
      action :periodic
    end

    package 'apt-transport-https'

    apt_repository 'erlang_solutions_repo' do
      uri new_resource.apt_repo_uri
      distribution new_resource.lsb_codename
      components ['contrib']
      key new_resource.apt_repo_key
      action :add
    end

    apt_preference 'erlang_solutions_repo' do
      package_name new_resource.package_name
      pin "version #{new_resource.version}"
      pin_priority '700'
      action :add
      only_if { new_resource.version }
    end
  when 'rhel'
    package 'epel-release' if new_resource.install_epel_repository

    yum_repository 'erlang_solutions' do
      description 'Erlang Solutions'
      baseurl new_resource.yum_repo_baseurl
      gpgkey new_resource.yum_repo_gpgkey
      gpgcheck true
      enabled true
      action :create
    end
  else
    raise Chef::Exceptions::UnsupportedPlatform, "erlang_esl is not supported on #{node['platform_family']}"
  end

  package new_resource.package_name do
    version new_resource.version if new_resource.version
    action :install
  end
end

action :remove do
  package new_resource.package_name do
    action :remove
  end

  if platform_family?('debian')
    apt_preference 'erlang_solutions_repo' do
      action :remove
    end

    apt_repository 'erlang_solutions_repo' do
      action :remove
    end
  elsif platform_family?('rhel')
    yum_repository 'erlang_solutions' do
      action :remove
    end
  end
end
