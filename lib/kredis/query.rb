# frozen_string_literal: true

require_relative "query/version"
require_relative "query/search"

module Kredis
  extend Query::Search
  module Query
    class Error < StandardError; end
    # Your code goes here...
  end
end
