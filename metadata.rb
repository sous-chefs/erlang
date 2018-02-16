name              'erlang'
maintainer        'Chef Software, Inc.'
maintainer_email  'cookbooks@chef.io'
license           'Apache-2.0'
description       'Installs erlang, optionally install GUI tools.'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '6.0.0'

depends           'yum-epel'
depends           'yum-erlang_solutions', '>= 1.0.3'
depends           'build-essential'

recipe 'erlang', 'Installs Erlang via native package, source, or Erlang Solutions package'
recipe 'erlang::package', 'Installs Erlang via native package'
recipe 'erlang::source', 'Installs Erlang via source'
recipe 'erlang::esl', "Installs Erlang from Erlang Solutions' package repositories"

%w( amazon centos debian oracle redhat scientific ubuntu zlinux ).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/erlang'
issues_url 'https://github.com/chef-cookbooks/erlang/issues'
chef_version '>= 12.9'
