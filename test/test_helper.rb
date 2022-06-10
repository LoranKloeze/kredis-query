require "bundler/setup"
require "active_support/test_case"
require "active_support/testing/autorun"
require "minitest/mock"
require "pry"

require "kredis"
require "kredis/query"

Kredis.configurator = Class.new { def config_for(name) { db: "1" } end }.new

ActiveSupport::LogSubscriber.logger = ActiveSupport::Logger.new(STDOUT) if ENV["VERBOSE"]

class ActiveSupport::TestCase
  teardown { Kredis.clear_all }

end