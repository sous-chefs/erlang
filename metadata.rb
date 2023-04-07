name              'erlang'
maintainer        'Sous Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Installs erlang, optionally install GUI tools.'
version           '8.1.18'
source_url        'https://github.com/sous-chefs/erlang'
issues_url        'https://github.com/sous-chefs/erlang/issues'
chef_version      '>= 14'

depends           'yum-epel'
depends           'yum-erlang_solutions', '>= 1.0.3'

supports 'amazon'
supports 'centos'
supports 'debian'
supports 'oracle'
supports 'redhat'
supports 'scientific'
supports 'ubuntu'
supports 'zlinux'
