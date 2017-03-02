# erlang Cookbook CHANGELOG

This file is used to list changes made in each version of the erlang cookbook.

## 4.1.1 (2017-03-01)
- Fix packaging issue related to nox package on Ubuntu 16.04+
- Cookstyle fixes
- Loosen up the yum dependency

## 4.1.0 (2016-12-22)
- Replace BATS tests with InSpec
- Fix package and source installs for Fedora and openSUSE
- Update source version to 19.2
- Improved version check for source install guard

## 4.0.0 (2016-09-16)
- Testing updates
- Remove traces of minitest handler from the code
- Require Chef 12.1+ and use multipackage for installs

## v3.0.0 (2016-04-29)

- Default to Erlang 18.3
- Fix the download URL for erlang as it is not actually https
- Fixed the not_if that prevented source installs unless the version was different to know the full string of the installed version instead of the major. This would prevent Chef from installing 18.3 over 18.2.
- Added zlinux to the metadata
- Don't include apt::default on Debian/Ubuntu systems as it's not necessary to setup a repository
- Switch test-kitchen testing in Travis to kitchen-dokken as add Fedora, Debian, and Ubuntu 16.04 testing as well as source install testing

## v2.1.1 (2016-03-29)

- Fix bad version string in the metadata

## v2.1.0 (2016-03-29)

- Install R16B03 Erlang releae by default
- Update the Rubocop config and resolve warnings

## v2.0.1 (2015-10-20)

- Use https urls for downloads
- Fix the computed attributes to behave correctly so you can override version and get a correct download URL
- Added additional chefspecs
- Added integration testing in Travis CI with kitchen docker
- Fixed changelog typo
- Update chefignore / .gitignore files

## v2.0.0 (2015-10-20)

- The minimum supported Chef release is now 11
- Removed the workaround for Ubuntu 10.04 as 10.04 is no longer a supported platform
- Added additional platforms to the metadata
- Improved readme formatting
- Added source_url and issues_url to the metadata
- Add a .foodcritic file to ignore rules
- Updated the gitignore file
- Updated to more modern platforms in the Kitchen config
- Added chefignore file
- Added Chef standard rubocop config
- Updated Travis CI testing to use the ChefDK for up to date deps
- Removed duplicate deps from the Berksfile
- Updated Gemfile with the latest testing deps
- Updated testing and contributing docs
- Added maintainers.md and maintainers.toml files
- Added travis and cookbook version badges to the readme
- Added a Rakefile for simplified testing
- Added basic convergence Chefspec
- Resolved Rubocop warnings

## v1.5.8 (2015-04-20)

- Use source, not site, for Berksfile
- Lint fixes for rubocop and foodcritc
- Move cloud specific kitchen config to .kitchen.cloud.yml
- [#29](https://github.com/chef-cookbooks/erlang/pull/29): fail the Chef run when attempting to use ESL on RHEL-family v5\. The dependencies are not available, and blindly continuing leads to a broken state.
- 29: Don't add Erlang Solutions yum repository in the "package" recipe
- 29: Disable SSL verification of the EPEL repo in the "package" recipe due to an HTTP redirect bug in yum on RHEL -family 5.

## v1.5.7 (2015-03-02)

- Update Berksfile to use <https://supermarket.chef.io>
- Update the `CONTRIBUTING.md` file with new URLs and information
- Update copyright date and email addresses in `README.md`
- Change 'Opscode, Inc.' to 'Chef Software, Inc.' where appropriate
- [#24](https://github.com/chef-cookbooks/erlang/issues/24) - Add yum-epel recipe to install prereqs for erlang.

## v1.5.6 (2014-07-29)

- [#16](https://github.com/chef-cookbooks/erlang/issues/16) - Allow for systems with that do not have lsb installed

## v1.5.4 (2014-04-30)

- [COOK-4610] - New APT repository for ESL

## v1.5.2 (2014-03-18)

- [COOK-4296] Add an attribute for passing CFLAGS prior to compilation

## v1.5.0 (2014-02-25)

[COOK-4296] - Add custom build flags when building from source

## v1.4.2

COOK-4155, use a version in version conditional

## v1.4.0

Porting to use cookbook yum ~> 3.0 Moving tests from minitest to bats Fixing style against rubocop

## v1.3.6

fixing metadata version error. locking to 3.0

## v1.3.4

Locking yum dependency to '< 3'

## v1.3.2

### New Feature

- **[COOK-2915](https://tickets.opscode.com/browse/COOK-2915)** - Debian codename override

## v1.3.0

- Add support for Test Kitchen 1.0

### Bug

- [COOK-2595]: erlang cookbook now incorrectly depends on apt <= 1.7.0
- [COOK-2894]: erlang::esl uses nil attribute

### Improvement

- [COOK-2509]: Add support for installing Erlang/OTP from Erlang Solutions' repositories

## v1.2.0

- [COOK-2287] - Add support for installing Erlang from source

## v1.1.2

- [COOK-1215] - Support Amazon Linux in erlang cookbook
- [COOK-1884] - Erlang Readme does not reflect cookbook requirements

## v1.1.0

- [COOK-1782] - Add test kitchen support

## v1.0.0

- [COOK-905] - Fix installation on RHEL/CentOS 6+
