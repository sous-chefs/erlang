require 'spec_helper'

describe 'erlang::package' do
  describe 'Debian Platform Family' do
    let(:chef_run_debian) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
    end

    let(:debian_converged) { chef_run_debian.converge('erlang::package') }

    it 'converges successfully' do
      expect { :debian_converged }.to_not raise_error
    end

    it 'installs the erlang.dev package' do
      expect(debian_converged).to install_package('erlang-dev')
    end

    describe 'GUI Tools' do
      context 'gui_tools is false' do
        it 'installs erlang-nox erlang-x11 package by default' do
          expect(debian_converged).to install_package('erlang-nox')
        end

        it 'does not install erlang-x11 package' do
          expect(debian_converged).to_not install_package('erlang-x11')
        end
      end

      context 'gui_tools is true' do
        it 'installs erlang-x11 package' do
          chef_run_debian.node.override['erlang']['gui_tools'] = true
          gui_tools_run = chef_run_debian.converge('erlang::package')
          expect(gui_tools_run).to install_package('erlang-x11')
        end
      end
    end
  end

  describe 'RHEL Platform Family' do
    cached(:chef_run_rhel) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '7.3.1611')
                          .converge('erlang::package')
    end

    it 'converges successfully' do
      expect { :chef_run_rhel }.to_not raise_error
    end

    it 'includes the yum-epel recipe' do
      expect(chef_run_rhel).to include_recipe('yum-epel')
    end

    it 'installs the erlang package' do
      expect(chef_run_rhel).to install_package('erlang')
    end
  end
end
