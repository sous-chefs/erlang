# erlang Cookbook

[![Build Status](https://travis-ci.org/chef-cookbooks/erlang.svg?branch=master)](https://travis-ci.org/chef-cookbooks/erlang) [![Cookbook Version](https://img.shields.io/cookbook/v/erlang.svg)](https://supermarket.chef.io/cookbooks/erlang)

Manages installation of Erlang via packages or source.

## Requirements

### Platforms

- Debian/Ubuntu
- RHEL/CentOS/Scientific/Amazon/Oracle
- Fedora
- openSUSE

### Chef

- Chef 12.1+

### Cookbooks

- compat_resource
- yum-epel
- yum-erlang_solutions
- build-essential (for source compilation)

## Attributes

- `node['erlang']['gui_tools']` - whether to install the GUI tools for Erlang.
- `node['erlang']['install_method']` - Erlang installation method ("package", "source", or "esl" (for Erlang Solutions packages)).
- `node['erlang']['package']['version']` - OS specific version of Erlang package to install
- `node['erlang']['source']['version']` - Version of Erlang/OTP to install from source.
- `node['erlang']['source']['url']` - URL of Erlang/OTP source tarball.
- `node['erlang']['source']['checksum']` - Checksum of the Erlang/OTP source tarball.
- `node['erlang']['source']['build_flags']` - Build flags for compiling Erlang/OTP.
- `node['erlang']['source']['cflags']` - CFLAGS for configuring Erlang/OTP.
- `node['erlang']['esl']['version']` - version specifier for Erlang Solutions packages.
- `node['erlang']['esl']['lsb_codename']` - override the code name used for ESL packages, useful for installing the packages on distributions that they don't make specific packages available (e.g., maverick vs precise).

## Recipes

### default

Manages installation of Erlang. Includes the package or source recipe depending on the value of `node['erlang']['install_method']`.

### package

Installs Erlang from distribution packages.

### source

Installs Erlang from source.

### esl

Adds Erlang Solutions' [package repositories] on Debian, CentOS (>5), and Fedora systems, and installs the `esl-erlang` package.

## License & Authors

- Author: Joe Williams ([joe@joetify.com](mailto:joe@joetify.com))
- Author: Joshua Timberman ([joshua@chef.io](mailto:joshua@chef.io))
- Author: Matt Ray ([matt@chef.io](mailto:matt@chef.io))
- Author: Hector Castro ([hector@basho.com](mailto:hector@basho.com))
- Author: Christopher Maier ([cm@chef.io](mailto:cm@chef.io))

```text
Copyright 2011-2016, Chef Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

[package repositories]: https://www.erlang-solutions.com/downloads/download-erlang-otp
