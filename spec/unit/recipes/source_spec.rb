require 'spec_helper'

describe 'erlang::source' do
  context 'On Debain Platform Family' do
    cached(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04').converge('erlang::source') }

    it 'includes the build_essential resource' do
      expect(chef_run).to install_build_essential('install compilation tools')
    end

    it 'contains bash[install-erlang] with action nothing' do
      execute_resource = chef_run.bash('install-erlang')
      expect(execute_resource).to do_nothing
    end

    it 'installs dep packages' do
      expect(chef_run).to install_package(%w(tar libncurses5-dev openssl libssl-dev))
    end

    context 'Erlang source remote file' do
      let(:erlang_source_file) { "#{Chef::Config[:file_cache_path]}/otp_src_#{chef_run.node['erlang']['source']['version']}.tar.gz" }
      let(:remote_file_resource) { chef_run.remote_file(erlang_source_file) }

      it 'creates a remote_file of the Erlang source code' do
        expect(chef_run).to create_remote_file(erlang_source_file)
      end

      it 'sends a notification to the bash[install-erlang] resource' do
        expect(remote_file_resource).to notify('bash[install-erlang]').immediately
      end
    end
  end

  context 'RHEL Platform Family' do
    cached(:chef_run_rhel) do
      ChefSpec::SoloRunner.new(platform: 'centos')
                          .converge('erlang::source')
    end

    it 'installs dep packages' do
      expect(chef_run_rhel).to install_package(%w(tar ncurses-devel openssl-devel))
    end
  end
end
