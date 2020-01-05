require 'spec_helper'

describe 'erlang::package' do
  context 'Debian Platform Family' do
    platform 'ubuntu'

    it 'installs the erlang.dev package' do
      is_expected.to install_package('erlang-dev')
    end
  end

  context 'RHEL Platform Family' do
    platform 'centos'

    it 'includes the yum-epel recipe' do
      is_expected.to include_recipe('yum-epel')
    end

    it 'installs the erlang package' do
      is_expected.to install_package('erlang')
    end
  end
end
