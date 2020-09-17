# this check works on all versions
check = "erl -eval \'erlang:display(erlang:system_info(otp_release)), halt().\'  -noshell"
ver = command(check).stdout

if ver =~ /R\d*B\d*/
  describe command(check) do
    its('stdout') { should match(/R\d*B\d*/) }
  end
else
  cmd = 'erl -eval \'{ok, Version} = file:read_file(filename:join([code:root_dir(), "releases", erlang:system_info(otp_release), "OTP_VERSION"])), io:fwrite(Version), halt().\''
  describe command(cmd) do
    its('stdout') { should match(/\d?\.\d/) }
  end
end
