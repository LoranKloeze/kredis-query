# frozen_string_literal: true

module Kredis
  module Query
    module Search
      def search(key_pattern, batch_size: 1000, config: :shared)
        pattern = namespace ? "#{namespace}:#{key_pattern}" : key_pattern
        cursor = "0"
        loop do
          cursor, keys = redis(config: config).scan(cursor, match: pattern, count: batch_size)
          redis.multi { |pipeline| yield keys, pipeline }
          break if cursor == "0"
        end
      end
    end
  end
end
