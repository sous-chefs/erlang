# Limitations

## Package Availability

### APT (Debian/Ubuntu)

- Debian 12: `erlang-dev` is available from the Debian repositories and depends on the matching `erlang-base` package.
- Debian 13: Erlang packages are available from the Debian repositories.
- Ubuntu 22.04: Erlang packages are available from Ubuntu Universe for amd64 and common port architectures.
- Ubuntu 24.04: Erlang packages are available from Ubuntu Universe for amd64 and common port architectures.
- Ubuntu 26.04: Erlang packages are available from Ubuntu Universe for amd64 and common port architectures. The cookbook metadata supports it through `supports 'ubuntu', '>= 22.04'`, but it is not in the Dokken CI matrix until a `dokken/ubuntu-26.04` image is published.
- Erlang Solutions discontinued prebuilt Erlang/OTP and Elixir binary packages effective 2025-01-20. The `erlang_esl` resource is retained only for legacy repositories and is not covered by Kitchen integration tests.

### DNF/YUM (RHEL family)

- RHEL-compatible 8 and 9 platforms can install Erlang from EPEL. EPEL currently publishes `erlang` for EL8 and EL9.
- RHEL-compatible 10 platforms are supported by the OS vendors, and Dokken images exist for several EL10 derivatives, but EPEL does not currently publish an Erlang package for EL10. EL10 is not included in the package-install test matrix.
- Oracle Linux is not included in metadata or Kitchen because EPEL repository handling differs from other EL derivatives and Erlang package availability was not confirmed in Oracle public EPEL indexes.
- Fedora publishes Erlang packages in the Fedora repositories.
- Erlang Solutions RPM packages use the Erlang Solutions CentOS-style repository URL supplied to `erlang_esl`. Treat this as legacy-only because Erlang Solutions stopped publishing new binary packages.

### Zypper (SUSE)

- openSUSE Leap is not included in the tested platform matrix. Erlang Solutions does not provide a zypper repository path used by this cookbook.

## Architecture Limitations

- Distribution packages generally support amd64 and the common distribution port architectures. Kitchen coverage for this cookbook is container-based amd64.
- Erlang Solutions package availability varies by repository path and release; the cookbook exposes repository URL properties so users can override stale upstream paths.

## Source/Compiled Installation

### Build Dependencies

|Platform Family|Packages|
|---|---|
|Debian|`tar`, `libncurses-dev`, `openssl`, `libssl-dev`|
|RHEL/Fedora/Amazon|`tar`, `ncurses-devel`, `openssl-devel`|
|SUSE|`tar`, `ncurses-devel`, `libopenssl-devel`|

Erlang/OTP upstream documents source builds as supported on Unix/Linux systems with GNU make, gcc or clang, Perl 5, ncurses or equivalent development headers, sed, and an install program. OpenSSL development headers are required for `crypto`, `ssl`, and `ssh`.

## Known Issues

- Legacy CentOS Linux, Scientific Linux, Amazon Linux, Debian 11, and Ubuntu 20.04 are not included in the modernized platform test matrix.
- EL10 and Ubuntu 26.04 are not included in Kitchen/CI yet because package and Dokken image availability are not both present.
- Chef metadata `supports` declarations cannot express tested upper bounds; Kitchen and CI are the authoritative tested platform list.
- `erlang_source` builds from upstream source tarballs and can take significantly longer than package installs.
