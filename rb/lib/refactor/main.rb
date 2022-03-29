# frozen_string_literal: true

module Refactor
  class Main
    def self.run(args)
      type, path = args

      case type
      when "code"
        CodeStructure.refactor!(path: path)
      when "file"
        FileStructure.refactor!(path: path)
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  $LOAD_PATH.unshift(File.expand_path("../../lib", __dir__))

  require("rubygems")
  require("bundler/setup")

  Bundler.require(:default, :refactor)
  require("refactor")

  Refactor::Main.run(ARGV)
end
