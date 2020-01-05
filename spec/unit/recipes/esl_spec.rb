require 'spec_helper'

describe 'erlang::esl' do
  context 'Debian Platform Family' do
    platform 'ubuntu'

    it 'adds the erlang_solutions_repo apt repository' do
     is_expected.to add_apt_repository('erlang_solutions_repo')
    end

    it 'installs the esl-erlang package' do
     is_expected.to install_package('esl-erlang')
    end
  end

  context 'RHEL Platform Family' do
    platform 'centos'

    it 'includes the yum-erlang_solutions recipe' do
      is_expected.to include_recipe('yum-erlang_solutions')
    end
  end
end
