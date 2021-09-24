# typed: true
# frozen_string_literal: true

require_relative("./base")
require_relative("../util/word")

#
# Before:
#
#   module ChapterOne
#     class TestTwo < Minitest::Test
#       def test_two
#         Two.new
#       end
#     end
#   end
#
# After:
#
#   module ChapterOne
#     class TestTwo < Minitest::Test
#       def test_two
#         P2.new
#       end
#     end
#   end
#
module Refactor
  module CodeStructure
    class CallMethodOnProblem < Base
      def self.register(rewriter)
        rewriter.add_send_refactor(self)
      end

      #
      # (send (const nil :One) :new)
      def match?
        send_receiver_node_type == :const && Util::Word.complete_match?(send_receiver_node_name)
      end

      def execute!
        rewriter.replace(expression, rename)
      end

      private

      def send_receiver_node_type
        send_receiver_node&.type
      end

      def send_receiver_node_name
        send_receiver_node&.children&.dig(-1).to_s
      end

      def expression
        send_receiver_node.location.expression
      end

      def rename
        "P#{Util::Word.replace(send_receiver_node_name)}"
      end

      def send_receiver_node
        node.children[0]
      end
    end
  end
end
