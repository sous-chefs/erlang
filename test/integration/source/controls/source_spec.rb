# frozen_string_literal: true

require_relative '../../spec_helper'

title 'Erlang Source Install Tests'

control 'erlang-source-01' do
  impact 1.0
  title 'Erlang source install is linked into the PATH'

  describe file('/usr/local/erlang/28.5/bin/erl') do
    it { should exist }
    it { should be_executable }
  end

  describe file('/usr/local/bin/erl') do
    it { should be_symlink }
    its('link_path') { should eq '/usr/local/erlang/28.5/lib/erlang/bin/erl' }
  end

  describe command(erlang_version_command) do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/28\.5/) }
  end
end
