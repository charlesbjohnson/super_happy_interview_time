# frozen_string_literal: true

module Refactor
  class FileStructure
    def self.refactor!(path:)
      FileUtils.mv(path, Util::Path.for_file(path))
    end
  end
end
