# frozen_string_literal: true

require 'spec_helper'

describe 'erlang_package' do
  step_into :erlang_package

  context 'on ubuntu' do
    platform 'ubuntu', '24.04'

    recipe do
      erlang_package 'default'
    end

    it { is_expected.to periodic_apt_update('update') }
    it { is_expected.to install_package('erlang-dev') }
  end

  context 'on almalinux' do
    platform 'almalinux', '9'

    recipe do
      erlang_package 'default'
    end

    it { is_expected.to install_package('epel-release') }
    it { is_expected.to install_package('erlang') }
  end

  context 'with a custom package version' do
    platform 'almalinux', '9'

    recipe do
      erlang_package 'default' do
        version '26.2.5-1.el9'
      end
    end

    it { is_expected.to install_package('erlang').with(version: '26.2.5-1.el9') }
  end

  context 'when removing erlang' do
    platform 'ubuntu', '24.04'

    recipe do
      erlang_package 'default' do
        action :remove
      end
    end

    it { is_expected.to remove_package('erlang-dev') }
  end
end
