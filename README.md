# erlang Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/erlang.svg)](https://supermarket.chef.io/cookbooks/erlang)
[![CI State](https://github.com/sous-chefs/erlang/workflows/ci/badge.svg)](https://github.com/sous-chefs/erlang/actions?query=workflow%3Aci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

Manages installation of Erlang via packages or source.

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit [sous-chefs.org](https://sous-chefs.org/) or come chat with us on the Chef Community Slack in [#sous-chefs](https://chefcommunity.slack.com/messages/C2V7B88SF).

## Requirements

### Platforms

- Debian/Ubuntu 16.04+
- RHEL/CentOS/Scientific/Amazon/Oracle 6+
- Fedora
- openSUSE

### Chef

- Chef 14+

### Cookbooks

- yum-epel
- yum-erlang_solutions

## Attributes

- `node['erlang']['gui_tools']` - whether to install the GUI tools for Erlang.
- `node['erlang']['install_method']` - Erlang installation method ("package", "source", or "esl" (for Erlang Solutions packages)).
- `node['erlang']['package']['version']` - OS specific version of Erlang package to install
- `node['erlang']['package']['install_epel_repository']` - Boolean flag indicating whether EPEL yum repository should be installed (in which case Erlang packages may be retrieved from there).
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

[package repositories]: https://www.erlang-solutions.com/downloads/download-erlang-otp

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)
