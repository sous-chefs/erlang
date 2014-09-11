require 'spec_helper'

describe 'erlang::package' do
  describe 'rhel' do
    let(:runner) { ChefSpec::Runner.new(REDHAT_OPTS) }
    let(:node) { runner.node }
    let(:chef_run) { runner.converge(described_recipe) }

    it 'includes yum-erlang_solutions recipe' do
      expect(chef_run).to include_recipe('yum-erlang_solutions')
    end

    describe 'uses distro version' do
      before do
        node.set['erlang']['use_distro_version'] = true
      end

      it 'does not include yum-erlang_solutions recipe' do
        expect(chef_run).not_to include_recipe('yum-erlang_solutions')
      end
    end
  end
end
