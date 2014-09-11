require 'chefspec'
require 'chefspec/berkshelf'

at_exit { ChefSpec::Coverage.report! }

LOG_LEVEL = :fatal
REDHAT_OPTS = {
  platform: 'redhat',
  version: '6.5',
  log_level: LOG_LEVEL
}
