# Cookbook:: erlang
# Recipe:: source
# Author:: Joe Williams <joe@joetify.com>
# Author:: Matt Ray <matt@chef.io>
# Author:: Hector Castro <hector@basho.com>
#
# Copyright:: 2008-2016, Joe Williams
# Copyright:: 2011-2016, Chef Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'build-essential'

case node['platform_family']
when 'debian'
  package %w(tar libncurses5-dev openssl libssl-dev)
when 'rhel', 'fedora'
  package %w(tar ncurses-devel openssl-devel)
when 'suse'
  package %w(tar ncurses-devel libopenssl-devel)
end

erlang_version     = node['erlang']['source']['version']
erlang_url         = node['erlang']['source']['url'] || "http://erlang.org/download/otp_src_#{erlang_version}.tar.gz"
erlang_checksum    = node['erlang']['source']['checksum']
erlang_build_flags = node['erlang']['source']['build_flags']
erlang_cflags      = node['erlang']['source']['cflags']

ver_check = if erlang_version =~ /R\d*B\d*/
              "erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().'  -noshell"
            else
              "erl -eval '{ok, Version} = file:read_file(filename:join([code:root_dir(), \"releases\", erlang:system_info(otp_release), \"OTP_VERSION\"])), erlang:display(erlang:binary_to_list(Version)), halt().' -noshell"
            end

bash 'install-erlang' do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    tar -xzf otp_src_#{erlang_version}.tar.gz
    (cd otp_src_#{erlang_version} && ./configure #{erlang_build_flags} && make && make install)
  EOH
  environment('CFLAGS' => erlang_cflags)
  action :nothing
  not_if "#{ver_check} | grep #{erlang_version}"
end

remote_file File.join(Chef::Config[:file_cache_path], "otp_src_#{erlang_version}.tar.gz") do
  source erlang_url
  owner 'root'
  mode '0644'
  checksum erlang_checksum
  notifies :run, 'bash[install-erlang]', :immediately
end
