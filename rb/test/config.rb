# frozen_string_literal: true

Bundler.require(:default, :test)

SimpleCov.root(File.expand_path("../", __dir__))
SimpleCov.start {
  load_profile(:bundler_filter)
  load_profile(:test_frameworks)
}

Minitest::Reporters.use!(Minitest::Reporters::DefaultReporter.new)
