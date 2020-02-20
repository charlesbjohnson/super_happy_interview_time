# typed: true
# frozen_string_literal: true

require_relative './code_structure'
require_relative './file_structure'

module Refactor
  class Main
    def self.run(args)
      type, path = args

      case type
      when 'code'
        CodeStructure.refactor!(path: path)
      when 'file'
        FileStructure.refactor!(path: path)
      end
    end
  end
end

Refactor::Main.run(ARGV) if __FILE__ == $PROGRAM_NAME
