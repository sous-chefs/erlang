# frozen_string_literal: true

provides :erlang_package
unified_mode true

property :package_name, [String, Array, nil]
property :version, [String, nil]
property :install_epel_repository, [true, false], default: true

default_action :install

action :install do
  apt_update 'update' do
    action :periodic
  end if platform_family?('debian')

  package 'epel-release' if platform_family?('rhel', 'amazon') && new_resource.install_epel_repository

  package erlang_resolved_package_name do
    version new_resource.version if new_resource.version && erlang_resolved_package_name.is_a?(String)
    action :install
  end
end

action :remove do
  package erlang_resolved_package_name do
    action :remove
  end
end

action_class do
  include ErlangCookbook::Helpers

  def erlang_resolved_package_name
    new_resource.package_name || erlang_package_name
  end
end
