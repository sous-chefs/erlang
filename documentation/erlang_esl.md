# erlang_esl

Installs Erlang from legacy Erlang Solutions package repositories.

Erlang Solutions discontinued prebuilt Erlang/OTP and Elixir binary packages on 2025-01-20. This resource is retained for users with legacy repository access and is not covered by Kitchen integration tests.

## Actions

|Action|Description|
|---|---|
|`:install`|Configures the Erlang Solutions repository and installs `esl-erlang`.|
|`:remove`|Removes `esl-erlang` and the configured Erlang Solutions repository.|

## Properties

|Property|Type|Default|Description|
|---|---|---|---|
|`package_name`|String|`esl-erlang`|ESL package name to install.|
|`version`|String|`nil`|Optional package version to install and pin.|
|`lsb_codename`|String|platform codename or version|Debian/Ubuntu distribution name for the APT repository.|
|`apt_repo_uri`|String|`https://packages.erlang-solutions.com/debian/`|Erlang Solutions APT repository URI.|
|`apt_repo_key`|String|`https://packages.erlang-solutions.com/debian/erlang_solutions.asc`|Erlang Solutions APT repository key URL.|
|`yum_repo_baseurl`|String|`https://packages.erlang-solutions.com/rpm/centos/$releasever/$basearch`|Erlang Solutions YUM repository base URL.|
|`yum_repo_gpgkey`|String|`https://packages.erlang-solutions.com/debian/erlang_solutions.asc`|Erlang Solutions YUM repository GPG key URL.|
|`install_epel_repository`|true, false|`true`|Installs `epel-release` before configuring the repository on RHEL-family platforms.|

## Examples

### Basic usage

```ruby
erlang_esl 'default' do
  lsb_codename 'jammy'
end
```

### Pin a package version

```ruby
erlang_esl 'default' do
  lsb_codename 'jammy'
  version '1:26.2.5'
end
```

### Custom legacy repository

```ruby
erlang_esl 'default' do
  yum_repo_baseurl 'https://mirror.example.com/erlang-solutions/$releasever/$basearch'
end
```
