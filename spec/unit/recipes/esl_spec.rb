require 'spec_helper'

describe 'erlang::esl' do
  describe 'Debian Platform Family' do
    cached(:chef_run_debian) do
      ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
                            .converge('erlang::esl')
    end

    it 'converges successfully' do
      expect { :chef_run_debian }.to_not raise_error
    end

    it 'adds the erlang_solutions_repo apt repository' do
      expect(chef_run_debian).to add_apt_repository('erlang_solutions_repo')
    end

    it 'installs the esl-erlang package' do
      expect(chef_run_debian).to install_package('esl-erlang')
    end
  end

  describe 'RHEL Platform Family' do
    cached(:chef_run_rhel) do
      ChefSpec::ServerRunner.new(platform: 'centos', version: '7.3.1611')
                            .converge('erlang::esl')
    end

    it 'converges successfully' do
      expect { :chef_run_rhel }.to_not raise_error
    end

    it 'includes the yum-erlang_solutions recipe' do
      expect(chef_run_rhel).to include_recipe('yum-erlang_solutions')
    end
  end
end
