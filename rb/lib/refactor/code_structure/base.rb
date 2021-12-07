# frozen_string_literal: true

module Refactor
  module CodeStructure
    class Base
      def self.register
        raise(NotImplementedError)
      end

      def initialize(rewriter, node)
        @rewriter = rewriter
        @node = node
      end

      def match?
        raise(NotImplementedError)
      end

      def execute!
        raise(NotImplementedError)
      end

      private

      attr_reader(
        :rewriter,
        :node
      )
    end
  end
end
