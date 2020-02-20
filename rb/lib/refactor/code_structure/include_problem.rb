# typed: true
# frozen_string_literal: true

require_relative './base'
require_relative '../util/word'

#
# Before:
#
#   module ChapterOne
#     class TestOne < Minitest::Test
#       include One
#     end
#   end
#
# After:
#
#   module ChapterOne
#     class TestOne < Minitest::Test
#       include P1
#     end
#   end
#
module Refactor
  module CodeStructure
    class IncludeProblem < Base
      def self.register(rewriter)
        rewriter.add_send_refactor(self)
      end

      #
      # (send nil :include (const nil :One))
      def match?
        send_message == :include \
          && send_param_node_type == :const \
          && Util::Word.complete_match?(send_param_node_name)
      end

      def execute!
        rewriter.replace(expression, rename)
      end

      private

      def send_message
        node.children[1]
      end

      def send_param_node_type
        send_param_node&.type
      end

      def send_param_node_name
        send_param_node&.children&.dig(-1).to_s
      end

      def expression
        send_param_node.location.expression
      end

      def rename
        "P#{Util::Word.replace(send_param_node_name)}"
      end

      def send_param_node
        node.children[-1]
      end
    end
  end
end
