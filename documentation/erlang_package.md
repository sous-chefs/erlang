# erlang_package

Installs Erlang from distribution packages.

## Actions

| Action | Description |
|--------|-------------|
| `:install` | Installs Erlang from distro packages. |
| `:remove` | Removes the Erlang package. |

## Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `package_name` | String, Array | platform-specific | Package name or names to install. Debian-family platforms default to `erlang-dev`; other platforms default to `erlang`. |
| `version` | String | `nil` | Package version to install. |
| `install_epel_repository` | true, false | `true` | Installs `epel-release` before Erlang on RHEL-family platforms. |

## Examples

### Basic usage

```ruby
erlang_package 'default'
```

### Install a specific package version

```ruby
erlang_package 'default' do
  version '26.2.5-1.el9'
end
```

### Custom package name

```ruby
erlang_package 'default' do
  package_name 'erlang'
end
```
