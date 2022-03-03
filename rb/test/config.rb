# frozen_string_literal: true

require("simplecov")

SimpleCov.root(File.expand_path("../", __dir__))
SimpleCov.start {
  load_profile(:bundler_filter)
  load_profile(:test_frameworks)
}

require("debug")
require("awesome_print")
require("minitest/reporters")

Minitest::Reporters.use!(Minitest::Reporters::DefaultReporter.new)
