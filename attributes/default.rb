#
# Author:: Joshua Timberman <joshua@chef.io>
# Cookbook:: erlang
# Attributes:: default
#
# Copyright:: 2012-2019, Chef Software, Inc. <legal@chef.io>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['erlang']['install_method'] = 'package'

default['erlang']['source']['version'] = '23.1'
default['erlang']['source']['checksum'] = 'cb5b7246eeaac9298c51c9915386df2f784e82a3f7ff93b68453591f0b370400'
default['erlang']['source']['build_flags'] = ''
default['erlang']['source']['cflags'] = '-O2 -g'

default['erlang']['esl']['version'] = nil
default['erlang']['esl']['lsb_codename'] = node['lsb'] ? node['lsb']['codename'] : 'no_lsb'

# NOTE: these parameters are only used by Debian and derivatives. On Red
# Hat-based systems, use the equivalent parameters in the
# `yum-erlang_solutions` cookbook:
# default['yum']['erlang_solutions']['baseurl']
# default['yum']['erlang_solutions']['gpgkey']
default['erlang']['esl']['repo']['uri'] = 'https://packages.erlang-solutions.com/debian/'
default['erlang']['esl']['repo']['key'] = 'https://packages.erlang-solutions.com/debian/erlang_solutions.asc'

default['erlang']['package']['version'] = nil
default['erlang']['package']['install_epel_repository'] = true
