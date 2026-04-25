# frozen_string_literal: true

require 'spec_helper'

describe 'erlang_source' do
  step_into :erlang_source

  context 'on ubuntu' do
    platform 'ubuntu', '24.04'

    recipe do
      erlang_source 'default' do
        version '23.1'
        checksum 'cb5b7246eeaac9298c51c9915386df2f784e82a3f7ff93b68453591f0b370400'
      end
    end

    let(:tarball) { "#{Chef::Config[:file_cache_path]}/otp_src_23.1.tar.gz" }

    it { is_expected.to periodic_apt_update('update') }
    it { is_expected.to install_build_essential('install compilation tools') }
    it { is_expected.to install_package(%w(tar libncurses-dev openssl libssl-dev)) }
    it { is_expected.to create_remote_file(tarball) }
    it { is_expected.to nothing_bash('install-erlang-23.1') }
    it { is_expected.to create_link('/usr/local/bin/erl').with(to: '/usr/local/erlang/23.1/bin/erl') }
  end

  context 'on almalinux' do
    platform 'almalinux', '9'

    recipe do
      erlang_source 'default'
    end

    it { is_expected.to install_package(%w(tar ncurses-devel openssl-devel)) }
  end

  context 'when removing a source install' do
    platform 'ubuntu', '24.04'

    recipe do
      erlang_source 'default' do
        version '23.1'
        action :remove
      end
    end

    it { is_expected.to delete_link('/usr/local/bin/erl') }
    it { is_expected.to delete_directory('/usr/local/erlang/23.1') }
  end
end
