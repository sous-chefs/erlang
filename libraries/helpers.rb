# frozen_string_literal: true

module ErlangCookbook
  module Helpers
    def erlang_package_name
      platform_family?('debian') ? 'erlang-dev' : 'erlang'
    end

    def erlang_build_dependencies
      case node['platform_family']
      when 'debian'
        %w(tar libncurses-dev openssl libssl-dev)
      when 'rhel', 'fedora', 'amazon'
        %w(tar ncurses-devel openssl-devel)
      when 'suse'
        %w(tar ncurses-devel libopenssl-devel)
      else
        raise Chef::Exceptions::UnsupportedPlatform, "Unsupported platform family: #{node['platform_family']}"
      end
    end

    def erlang_source_version_check(erl_binary, version)
      if version.match?(/R\d*B\d*/)
        "#{erl_binary} -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -noshell | grep #{version}"
      else
        "#{erl_binary} -eval '{ok, Version} = file:read_file(filename:join([code:root_dir(), \"releases\", erlang:system_info(otp_release), \"OTP_VERSION\"])), erlang:display(erlang:binary_to_list(Version)), halt().' -noshell | grep #{version}"
      end
    end
  end
end
