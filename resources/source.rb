# frozen_string_literal: true

provides :erlang_source
unified_mode true

property :version, String, default: '28.5'
property :checksum, [String, nil]
property :url, String, default: lazy { "https://github.com/erlang/otp/releases/download/OTP-#{version}/otp_src_#{version}.tar.gz" }
property :build_flags, String, default: ''
property :cflags, String, default: '-O2 -g'
property :install_prefix, String, default: lazy { "/usr/local/erlang/#{version}" }
property :symlink_dir, String, default: '/usr/local/bin'

default_action :install

action :install do
  tarball = ::File.join(Chef::Config[:file_cache_path], "otp_src_#{new_resource.version}.tar.gz")
  source_dir = ::File.join(Chef::Config[:file_cache_path], "otp_src_#{new_resource.version}")
  erl_binary = ::File.join(new_resource.install_prefix, 'bin', 'erl')

  apt_update 'update' do
    action :periodic
  end if platform_family?('debian')

  build_essential 'install compilation tools'

  package erlang_build_dependencies

  bash "install-erlang-#{new_resource.version}" do
    cwd Chef::Config[:file_cache_path]
    code <<~EOH
      rm -rf #{source_dir}
      tar -xzf #{tarball}
      cd #{source_dir}
      ./configure --prefix=#{new_resource.install_prefix} #{new_resource.build_flags}
      make
      make install
    EOH
    environment('CFLAGS' => new_resource.cflags)
    action :nothing
    not_if erlang_source_version_check(erl_binary, new_resource.version)
  end

  remote_file tarball do
    source new_resource.url
    owner 'root'
    mode '0644'
    checksum new_resource.checksum if new_resource.checksum
    notifies :run, "bash[install-erlang-#{new_resource.version}]", :immediately
  end

  %w(erl erlc).each do |binary|
    link ::File.join(new_resource.symlink_dir, binary) do
      to ::File.join(new_resource.install_prefix, 'bin', binary)
    end
  end
end

action :remove do
  %w(erl erlc).each do |binary|
    link ::File.join(new_resource.symlink_dir, binary) do
      action :delete
    end
  end

  directory new_resource.install_prefix do
    recursive true
    action :delete
  end

  directory ::File.join(Chef::Config[:file_cache_path], "otp_src_#{new_resource.version}") do
    recursive true
    action :delete
  end

  file ::File.join(Chef::Config[:file_cache_path], "otp_src_#{new_resource.version}.tar.gz") do
    action :delete
  end
end

action_class do
  include ErlangCookbook::Helpers
end
