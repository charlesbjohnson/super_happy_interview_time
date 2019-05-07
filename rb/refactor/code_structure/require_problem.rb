# frozen_string_literal: true

require_relative './base'
require_relative '../lib/path'

#
# Before:
#
#   require 'config'
#
# After:
#
#   require 'config'
#   require 'ctci/ctci_c1_p1'
#
module Refactor
  module CodeStructure
    class RequireProblem < Base
      def self.register(rewriter)
        rewriter.add_send_refactor(self)
      end

      #
      # (send nil :require (str "config"))
      def match?
        send_message == :require \
          && send_param_node_type == :str \
          && send_param_node_contents == 'config'
      end

      def execute!
        rewriter.insert_after(expression, generate_require)
      end

      private

      def send_message
        node.children[1]
      end

      def send_param_node_type
        send_param_node&.type
      end

      def send_param_node_contents
        send_param_node&.children&.dig(-1)
      end

      def expression
        send_param_node.location.expression
      end

      def generate_require
        "\nrequire '#{Lib::Path.for_require(rewriter.path)}'"
      end

      def send_param_node
        node.children[-1]
      end
    end
  end
end
