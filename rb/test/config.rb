# typed: ignore
# frozen_string_literal: true

require("simplecov")

SimpleCov.root(File.expand_path("../", __dir__))
SimpleCov.start {
  load_profile(:bundler_filter)
  load_profile(:test_frameworks)
}

require("byebug")

require("minitest/autorun")
require("minitest/reporters")

Minitest::Reporters.use!(Minitest::Reporters::DefaultReporter.new)
