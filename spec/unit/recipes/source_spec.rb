require 'spec_helper'

describe 'erlang::source' do
  describe 'All Platforms' do
    cached(:chef_run) { ChefSpec::ServerRunner.new.converge('erlang::source') }

    it 'converges successfully' do
      expect { :chef_run_rhel }.to_not raise_error
    end

    it 'includes the build-essential recipe' do
      expect(chef_run).to include_recipe('build-essential')
    end

    it 'contains bash[install-erlang] with action nothing' do
      execute_resource = chef_run.bash('install-erlang')
      expect(execute_resource).to do_nothing
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

  describe 'Debian Platform Family' do
    cached(:chef_run_debian) do
      ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
                            .converge('erlang::source')
    end

    %w(libncurses5-dev openssl libssl-dev).each do |pkg|
      it "installs #{pkg} package" do
        expect(chef_run_debian).to install_package(pkg)
      end
    end
  end

  describe 'RHEL Platform Family' do
    cached(:chef_run_rhel) do
      ChefSpec::ServerRunner.new(platform: 'centos', version: '7.0')
                            .converge('erlang::source')
    end

    %w(ncurses-devel openssl-devel).each do |pkg|
      it "installs #{pkg} package" do
        expect(chef_run_rhel).to install_package(pkg)
      end
    end
  end
end
