# Migration from Recipes to Resources

This cookbook has migrated from recipe and attribute driven installation to custom resources.

## What Changed

The main cookbook no longer ships `recipes/` or `attributes/`. Consumers should declare one of the custom resources directly from their own wrapper cookbook or role recipe.

|Previous API|Replacement|
|---|---|
|`recipe[erlang]` with `node['erlang']['install_method'] = 'package'`|`erlang_package 'default'`|
|`recipe[erlang::package]`|`erlang_package 'default'`|
|`recipe[erlang::source]`|`erlang_source 'default'`|
|`recipe[erlang::esl]`|`erlang_esl 'default'`|

## Package Installs

Before:

```ruby
node.default['erlang']['install_method'] = 'package'
node.default['erlang']['package']['version'] = '26.2.5-1.el9'
node.default['erlang']['package']['install_epel_repository'] = true
include_recipe 'erlang'
```

After:

```ruby
erlang_package 'default' do
  version '26.2.5-1.el9'
  install_epel_repository true
end
```

## Source Installs

Before:

```ruby
node.default['erlang']['install_method'] = 'source'
node.default['erlang']['source']['version'] = '23.1'
node.default['erlang']['source']['checksum'] = 'cb5b7246eeaac9298c51c9915386df2f784e82a3f7ff93b68453591f0b370400'
node.default['erlang']['source']['build_flags'] = '--without-javac'
include_recipe 'erlang'
```

After:

```ruby
erlang_source 'default' do
  version '28.5'
  checksum 'sha256-checksum'
  build_flags '--without-javac'
end
```

The source default is now OTP `28.5`. OTP `23.1` is old and is not a good default for modern OpenSSL 3 platforms.

## Erlang Solutions Installs

Before:

```ruby
node.default['erlang']['install_method'] = 'esl'
node.default['erlang']['esl']['version'] = '1:26.2.5'
node.default['erlang']['esl']['lsb_codename'] = 'jammy'
include_recipe 'erlang'
```

After:

```ruby
erlang_esl 'default' do
  version '1:26.2.5'
  lsb_codename 'jammy'
end
```

Erlang Solutions discontinued prebuilt Erlang/OTP and Elixir binary packages on 2025-01-20. The `erlang_esl` resource remains for legacy repositories and mirrors, but it is not included in the Kitchen integration matrix.

## Property Mapping

|Old attribute|New resource property|
|---|---|
|`node['erlang']['package']['version']`|`erlang_package.version`|
|`node['erlang']['package']['install_epel_repository']`|`erlang_package.install_epel_repository`|
|`node['erlang']['source']['version']`|`erlang_source.version`|
|`node['erlang']['source']['url']`|`erlang_source.url`|
|`node['erlang']['source']['checksum']`|`erlang_source.checksum`|
|`node['erlang']['source']['build_flags']`|`erlang_source.build_flags`|
|`node['erlang']['source']['cflags']`|`erlang_source.cflags`|
|`node['erlang']['esl']['version']`|`erlang_esl.version`|
|`node['erlang']['esl']['lsb_codename']`|`erlang_esl.lsb_codename`|
|`node['erlang']['esl']['repo']['uri']`|`erlang_esl.apt_repo_uri`|
|`node['erlang']['esl']['repo']['key']`|`erlang_esl.apt_repo_key`|

## Platform Changes

EOL and unvalidated platforms were removed from cookbook metadata, Kitchen, and CI. The modern test matrix covers current Debian, Ubuntu LTS, Fedora, CentOS Stream 9, and EL8/EL9 compatible distributions with known Erlang package availability.

Ubuntu 26.04 is covered by the `supports 'ubuntu', '>= 22.04'` metadata declaration, but it is not included in Kitchen/CI until a `dokken/ubuntu-26.04` image is available. EL10 distributions are active and Dokken images exist for several derivatives, but Kitchen and CI remain capped at EL8/EL9 until EPEL publishes Erlang for EL10. Oracle Linux was removed from metadata and Kitchen because its EPEL setup differs from the generic `epel-release` path and Erlang package availability was not confirmed in Oracle public EPEL indexes.
