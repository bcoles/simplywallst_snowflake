#
# Copyright (c) 2017 Brendan Coles <bcoles@gmail.com>
# SimplywallstSnowflake - https://github.com/bcoles/simplywallst_snowflake
# See the file 'LICENSE.txt' for copying permission
#

require "bundler/setup"
require "simplywallst_snowflake"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
