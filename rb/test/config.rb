# typed: ignore
# frozen_string_literal: true

require("byebug")

require("minitest/autorun")
require("simplecov")

require("minitest/around/unit")
require("minitest/focus")
require("minitest/reporters")

Minitest::Reporters.use!(Minitest::Reporters::DefaultReporter.new)
SimpleCov.start
