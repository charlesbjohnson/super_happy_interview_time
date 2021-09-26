# typed: true
# frozen_string_literal: true

require_relative("./base")
require_relative("../util/word")

#
# Before:
#
#   module ChapterOne
#     module One
#     end
#   end
#
# After:
#
#   module C1
#     module One
#     end
#   end
#
module Refactor
  module CodeStructure
    class DeclareChapter < Base
      MATCH_REGEX = /\bchapter\w+\b/i
      REPLACE_REGEX = /chapter/i

      def self.register(rewriter)
        rewriter.add_module_refactor(self)
      end

      #
      # (module (const nil :ChapterOne) nil)
      def match?
        declaration_node_type == :const \
          && MATCH_REGEX.match?(declaration_node_name) \
          && Util::Word.suffix_match?(declaration_node_name)
      end

      def execute!
        rewriter.replace(expression, rename)
      end

      private

      private_constant(
        :MATCH_REGEX,
        :REPLACE_REGEX
      )

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
        Util::Word.replace("C#{declaration_node_name.gsub(REPLACE_REGEX, "")}")
      end

      def declaration_node
        node.children[0]
      end
    end
  end
end
