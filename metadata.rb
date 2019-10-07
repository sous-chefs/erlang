name              'erlang'
maintainer        'Chef Software, Inc.'
maintainer_email  'cookbooks@chef.io'
license           'Apache-2.0'
description       'Installs erlang, optionally install GUI tools.'
version           '8.0.0'
depends           'yum-epel'
depends           'yum-erlang_solutions', '>= 1.0.3'

%w( amazon centos debian oracle redhat scientific ubuntu zlinux ).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/erlang'
issues_url 'https://github.com/chef-cookbooks/erlang/issues'
chef_version '>= 14'
