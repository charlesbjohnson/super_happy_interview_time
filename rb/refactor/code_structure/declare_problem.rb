# frozen_string_literal: true

require_relative './base'
require_relative '../lib/word'

#
# Before:
#
#   module ChapterOne
#     module One
#     end
#
#     class Two
#     end
#
#     class TestOne < Minitest::Test
#       include One
#     end
#   end
#
# After:
#
#   module ChapterOne
#     module P1
#     end
#
#     class P2
#     end
#
#     class TestP1 < Minitest::Test
#       include One
#     end
#   end
#
module Refactor
  module CodeStructure
    class DeclareProblem < Base
      MATCH_REGEX   = /\btest[\w]+\b/i.freeze
      REPLACE_REGEX = /test/i.freeze

      def self.register(rewriter)
        rewriter.add_class_refactor(self)
        rewriter.add_module_refactor(self)
      end

      #
      # (module (const nil :One) nil)
      # (class (const nil :One) nil nil)
      def match?
        declaration_node_type == :const && Lib::Word.match?(declaration_node_name)
      end

      def execute!
        rewriter.replace(expression, rename)
      end

      private

      private_constant \
        :MATCH_REGEX,
        :REPLACE_REGEX

      def declaration_node_type
        declaration_node&.type
      end

      def declaration_node_name
        declaration_node&.children&.dig(-1).to_s
      end

      def expression
        declaration_node.location.expression
      end

      def rename
        is_test = MATCH_REGEX.match?(declaration_node_name)

        result = declaration_node_name.gsub(REPLACE_REGEX, '')
        result = "P#{Lib::Word.replace(result)}"

        is_test ? "Test#{result}" : result
      end

      def declaration_node
        node.children[0]
      end
    end
  end
end
