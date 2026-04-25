# erlang_source

Builds and installs Erlang/OTP from an upstream source tarball.

## Actions

|Action|Description|
|---|---|
|`:install`|Installs build dependencies, downloads Erlang/OTP source, compiles it, and links `erl` and `erlc` into the PATH.|
|`:remove`|Removes links, the install prefix, extracted source directory, and source tarball.|

## Properties

|Property|Type|Default|Description|
|---|---|---|---|
|`version`|String|`28.5`|Erlang/OTP version to build.|
|`checksum`|String|`nil`|Optional checksum for the source tarball.|
|`url`|String|GitHub OTP release tarball for `version`|Source tarball URL.|
|`build_flags`|String|empty string|Additional flags passed to `./configure`.|
|`cflags`|String|`-O2 -g`|CFLAGS used during configure/build.|
|`install_prefix`|String|`/usr/local/erlang/<version>`|Installation prefix for the compiled Erlang tree.|
|`symlink_dir`|String|`/usr/local/bin`|Directory where `erl` and `erlc` symlinks are created.|

## Examples

### Basic usage

```ruby
erlang_source 'default'
```

### Build a specific release

```ruby
erlang_source 'default' do
  version '28.5'
  checksum 'sha256-checksum'
end
```

### Custom configure flags

```ruby
erlang_source 'default' do
  build_flags '--without-javac'
  cflags '-O2'
end
```
