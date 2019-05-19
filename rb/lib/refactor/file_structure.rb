# frozen_string_literal: true

require 'fileutils'

require_relative './util/path'

module Refactor
  class FileStructure
    def self.refactor!(path:)
      FileUtils.mv(path, Util::Path.for_file(path))
    end
  end
end
