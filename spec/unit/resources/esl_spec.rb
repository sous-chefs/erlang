# frozen_string_literal: true

require 'spec_helper'

describe 'erlang_esl' do
  step_into :erlang_esl

  context 'on ubuntu' do
    platform 'ubuntu', '24.04'

    recipe do
      erlang_esl 'default' do
        lsb_codename 'noble'
      end
    end

    it { is_expected.to periodic_apt_update('update') }
    it { is_expected.to install_package('apt-transport-https') }
    it { is_expected.to add_apt_repository('erlang_solutions_repo') }
    it { is_expected.to install_package('esl-erlang') }
  end

  context 'on ubuntu with a pinned version' do
    platform 'ubuntu', '24.04'

    recipe do
      erlang_esl 'default' do
        lsb_codename 'noble'
        version '1:26.2.5'
      end
    end

    it { is_expected.to add_apt_preference('erlang_solutions_repo') }
    it { is_expected.to install_package('esl-erlang').with(version: '1:26.2.5') }
  end

  context 'on almalinux' do
    platform 'almalinux', '9'

    recipe do
      erlang_esl 'default'
    end

    it { is_expected.to install_package('epel-release') }
    it { is_expected.to create_yum_repository('erlang_solutions') }
    it { is_expected.to install_package('esl-erlang') }
  end

  context 'when removing esl-erlang on ubuntu' do
    platform 'ubuntu', '24.04'

    recipe do
      erlang_esl 'default' do
        lsb_codename 'noble'
        action :remove
      end
    end

    it { is_expected.to remove_package('esl-erlang') }
    it { is_expected.to remove_apt_repository('erlang_solutions_repo') }
  end
end
