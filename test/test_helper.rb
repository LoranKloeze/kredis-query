# frozen_string_literal: true

require "bundler/setup"
require "active_support/test_case"
require "active_support/testing/autorun"
require "minitest/mock"
require "pry"

require "kredis"
require "kredis/query"

Kredis.configurator = Class.new do
  def config_for(_name)
    { db: "1" }
  end
end.new

ActiveSupport::LogSubscriber.logger = ActiveSupport::Logger.new($stdout) if ENV["VERBOSE"]

module ActiveSupport
  class TestCase
    teardown { Kredis.clear_all }
  end
end
