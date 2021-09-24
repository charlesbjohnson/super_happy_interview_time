# typed: false
# frozen_string_literal: true

require("cgi")
require("uri")

require("config")
require("leetcode/lc_535")

module LeetCode
  class TestLC535 < Minitest::Test
    include(LC535)

    def around
      REGISTRY.clear
      yield
    end

    [
      "",
      "https://leetcode.com/problems/design-tinyurl"
    ].each.with_index do |url, i|
      define_method(:"test_encode_#{i}") do
        actual = URI(encode(url))

        assert_equal("tinyurl.com", actual.host)
        assert_match(/http|https/, actual.scheme)
        assert(actual.path.length > 1)
      end
    end

    [
      ["https://tinyurl.com/lol", "", proc { |s| s }],
      ["https://example.com/lol", "https://example.com/lol", proc { |s| encode(s) }]
    ].each.with_index do |(actual, expected, action), i|
      define_method(:"test_decode_#{i}") do
        assert_equal(expected, decode(instance_exec(actual, &action)))
      end
    end
  end
end
