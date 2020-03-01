# typed: true
# frozen_string_literal: true

module Refactor
  module Util
    class Word
      Mapping = Struct.new(:word, :num) {
        def match?(str)
          regex.match?(str)
        end

        def suffix_match?(str)
          suffix_regex.match?(str)
        end

        def complete_match?(str)
          complete_regex.match?(str)
        end

        def replace(str)
          str.gsub(regex, num.to_s)
        end

        private

        def regex
          /#{word}/i
        end

        def suffix_regex
          /\b[\w\d]+#{word}\b/i
        end

        def complete_regex
          /\b#{word}\b/i
        end
      }

      MAPPINGS = [
        Mapping.new("one", 1),
        Mapping.new("two", 2),
        Mapping.new("three", 3),
        Mapping.new("four", 4),
        Mapping.new("five", 5),
        Mapping.new("six", 6),
        Mapping.new("seven", 7),
        Mapping.new("eight", 8),
        Mapping.new("nine", 9),
        Mapping.new("ten", 10),
        Mapping.new("eleven", 11),
        Mapping.new("twelve", 12),
        Mapping.new("thirteen", 13),
        Mapping.new("fourteen", 14),
        Mapping.new("fifteen", 15),
        Mapping.new("sixteen", 16)
      ].freeze

      def self.match?(str)
        MAPPINGS.any? { |map| map.match?(str) }
      end

      def self.suffix_match?(str)
        MAPPINGS.any? { |map| map.suffix_match?(str) }
      end

      def self.complete_match?(str)
        MAPPINGS.any? { |map| map.complete_match?(str) }
      end

      def self.replace(str)
        mapping = MAPPINGS.find { |mpng| mpng.match?(str) }
        mapping ? mapping.replace(str) : str
      end

      private_constant \
        :MAPPINGS,
        :Mapping
    end
  end
end
