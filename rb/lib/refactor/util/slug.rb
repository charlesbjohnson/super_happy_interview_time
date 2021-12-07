# frozen_string_literal: true

require_relative("./word")

module Refactor
  module Util
    class Slug
      CHAPTER_REGEX = /chapter_/i
      TEST_REGEX = /test_/i

      #
      # epi chapter_five test_one
      # => epi_c5_p1
      #
      def self.generate(source, chapter, problem)
        chapter = Word.replace(chapter.gsub(CHAPTER_REGEX, ""))
        problem = Word.replace(problem.gsub(TEST_REGEX, ""))
        "#{source}_c#{chapter}_p#{problem}"
      end

      private_constant(
        :CHAPTER_REGEX,
        :TEST_REGEX
      )
    end
  end
end
