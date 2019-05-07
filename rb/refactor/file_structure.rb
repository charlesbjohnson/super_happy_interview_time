# frozen_string_literal: true

require 'fileutils'

require_relative './lib/path'

module Refactor
  class FileStructure
    def self.refactor!(path:)
      FileUtils.mv(path, Lib::Path.for_file(path))
    end
  end
end
