# typed: false
# frozen_string_literal: true

require("parser")
require("parser/runner/ruby_rewrite")

require_relative("./code_structure/call_method_on_problem")
require_relative("./code_structure/declare_chapter")
require_relative("./code_structure/declare_problem")
require_relative("./code_structure/include_problem")
require_relative("./code_structure/require_problem")

module Refactor
  module CodeStructure
    def self.refactor!(path:)
      Parser::Runner::RubyRewrite.new.tap { |rewriter|
        rewriter.instance_variable_set(:@modify, true)
        rewriter.instance_variable_set(:@warnings, true)
        rewriter.instance_variable_get(:@rewriters).push(Factory.new(path: path))
      }.execute([path])
    end

    class Factory
      def initialize(path:)
        @path = path
      end

      def new
        Rewriter.new(path: path)
      end

      def name
        Rewriter.name
      end

      private

      attr_reader(:path)
    end

    class Rewriter < Parser::TreeRewriter
      attr_reader(:path)

      def initialize(path:)
        super()

        @path = path

        @class_refactor_factories = []
        @module_refactor_factories = []
        @send_refactor_factories = []

        CodeStructure::CallMethodOnProblem.register(self)
        CodeStructure::DeclareChapter.register(self)
        CodeStructure::DeclareProblem.register(self)
        CodeStructure::IncludeProblem.register(self)
        CodeStructure::RequireProblem.register(self)
      end

      def add_class_refactor(factory)
        class_refactor_factories.push(factory)
      end

      def add_module_refactor(factory)
        module_refactor_factories.push(factory)
      end

      def add_send_refactor(factory)
        send_refactor_factories.push(factory)
      end

      def on_class(node)
        find_and_execute_refactor(class_refactor_factories, node)
        super
      end

      def on_module(node)
        find_and_execute_refactor(module_refactor_factories, node)
        super
      end

      def on_send(node)
        find_and_execute_refactor(send_refactor_factories, node)
        super
      end

      private

      def find_and_execute_refactor(factories, node)
        refactor = factories.reduce(nil) { |found, factory|
          break found if found

          refactor = factory.new(self, node)
          refactor if refactor.match?
        }

        refactor&.execute!
      end

      attr_reader(
        :class_refactor_factories,
        :module_refactor_factories,
        :send_refactor_factories
      )
    end
  end
end
