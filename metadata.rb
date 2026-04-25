# frozen_string_literal: true

name              'erlang'
maintainer        'Sous Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Provides resources to install Erlang from distro packages, Erlang Solutions packages, or source.'
version           '8.1.29'
source_url        'https://github.com/sous-chefs/erlang'
issues_url        'https://github.com/sous-chefs/erlang/issues'
chef_version      '>= 15.3'

depends           'apt'

supports 'almalinux', '>= 8.0'
supports 'centos_stream', '>= 9.0'
supports 'debian', '>= 12.0'
supports 'fedora'
supports 'redhat', '>= 8.0'
supports 'rocky', '>= 8.0'
supports 'ubuntu', '>= 22.04'
