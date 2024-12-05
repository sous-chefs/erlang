# erlang Cookbook CHANGELOG

This file is used to list changes made in each version of the erlang cookbook.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 8.1.27 - *2024-12-05*

## 8.1.26 - *2024-11-18*

Standardise files with files in sous-chefs/repo-management

Standardise files with files in sous-chefs/repo-management

Standardise files with files in sous-chefs/repo-management

Standardise files with files in sous-chefs/repo-management

Standardise files with files in sous-chefs/repo-management

## 8.1.25 - *2024-05-02*

## 8.1.24 - *2024-05-02*

## 8.1.23 - *2023-09-28*

## 8.1.22 - *2023-09-11*

## 8.1.21 - *2023-07-10*

## 8.1.20 - *2023-05-17*

## 8.1.19 - *2023-04-17*

## 8.1.18 - *2023-04-07*

Standardise files with files in sous-chefs/repo-management

## 8.1.17 - *2023-04-01*

## 8.1.16 - *2023-04-01*

## 8.1.15 - *2023-04-01*

Standardise files with files in sous-chefs/repo-management

## 8.1.14 - *2023-03-20*

Standardise files with files in sous-chefs/repo-management

## 8.1.13 - *2023-03-15*

Standardise files with files in sous-chefs/repo-management

## 8.1.12 - *2023-03-02*

Standardise files with files in sous-chefs/repo-management

## 8.1.11 - *2023-02-23*

Standardise files with files in sous-chefs/repo-management

## 8.1.10 - *2023-02-16*

Standardise files with files in sous-chefs/repo-management

## 8.1.9 - *2023-02-15*

## 8.1.8 - *2023-02-15*

Standardise files with files in sous-chefs/repo-management

## 8.1.7 - *2023-02-14*

## 8.1.6 - *2023-02-14*

## 8.1.5 - *2022-12-09*

Standardise files with files in sous-chefs/repo-management

Standardise files with files in sous-chefs/repo-management

## 8.1.4 - *2022-02-17*

- Standardise files with files in sous-chefs/repo-management
- Remove delivery folder

## 8.1.3 - *2021-11-03*

- Add CentOS Stream 8 to CI pipeline

## 8.1.2 - *2021-08-30*

- Standardise files with files in sous-chefs/repo-management

## 8.1.0 (2020-10-15)

### Changed

- Sous Chefs Adoption
- Update Changelog to Sous Chefs
- Update to use Sous Chefs GH workflow
- Update README to sous-chefs
- Update metadata.rb to Sous Chefs
- Update test-kitchen to Sous Chefs
- Update source version to 23.1
- Exclude esl suite for a few platforms
- Include saner cflags which are required

### Fixed

- Yamllint fixes
- MDL fixes
- Various fixes for Amazon Linux

### Added

- Add amazonlinux support to package recipe
- Add CentOS 8 testing
- Add Ubuntu 20.04 testing

### Removed

- Remove CentOS 6 support
- Remove gui tools attribute and suites

## 8.0.0 (2019-10-07)

- Resolve Cookstyle 5.8 warnings - [@tas50](https://github.com/tas50)
- Require Chef Client 14+ and remove the dependency on build-essential - [@tas50](https://github.com/tas50)
- Remove support for RHEL 5 / Ubuntu 14.04 - [@tas50](https://github.com/tas50)

## 7.0.1 (2019-06-06)

- Remove the .foodcritic file with exclusions - [@tas50](https://github.com/tas50)
- Add a codeowners file - [@tas50](https://github.com/tas50)
- Update esl.rb to resolve failures- [@amurgatroyd](https://github.com/amurgatroyd)

## 7.0.0 (2018-08-30)

- If package version is specified pin version on debian when using esl. This requires the apt_preference resource which raises the minimum supported chef-client release for this cookbook to 13.3.

## 6.2.0 (2018-08-06)

- Allow specifying a mirror of the ESL repository with new attributes

## 6.1.1 (2018-05-15)

- Update kitchen configs
- Update specs to the latest platform versions

## 6.1.0 (2018-05-14)

- Use build_essential resource vs. recipe

## 6.0.0 (2018-02-16)

- Require Chef 12.9+ and remove compat_resource dep
- Testing improvements

## 5.1.0 (2017-04-04)

- Add of a new attribute toggling EPEL repo installation.

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
