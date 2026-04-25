# frozen_string_literal: true

require_relative '../../spec_helper'

title 'Default Erlang Package Tests'

control 'erlang-package-01' do
  impact 1.0
  title 'Erlang is installed from packages'

  describe command('erl -eval "erlang:display(erlang:system_info(otp_release)), halt()." -noshell') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/\d+|R\d+B\d+/) }
  end

  describe command(erlang_version_command) do
    its('exit_status') { should eq 0 }
  end
end
