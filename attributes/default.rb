#
# Author:: Joshua Timberman <joshua@chef.io>
# Cookbook:: erlang
# Attributes:: default
#
# Copyright:: 2012-2016, Chef Software, Inc. <legal@chef.io>
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

default['erlang']['gui_tools'] = false
default['erlang']['install_method'] = 'package'

default['erlang']['source']['version'] = '19.2'
default['erlang']['source']['checksum'] = 'a016b3ef5dac1e532972617b2715ef187ecb616f7cd7ddcfe0f1d502f5d24870'
default['erlang']['source']['build_flags'] = ''
default['erlang']['source']['cflags'] = ''

default['erlang']['esl']['version'] = nil
default['erlang']['esl']['lsb_codename'] = node['lsb'] ? node['lsb']['codename'] : 'no_lsb'

default['erlang']['package']['version'] = nil
