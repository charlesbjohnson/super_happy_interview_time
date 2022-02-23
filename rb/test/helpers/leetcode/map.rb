# frozen_string_literal: true

require("algorithms")
require("delegate")

module Helpers
  module LeetCode
    class TreeMap < DelegateClass(Containers::RBTreeMap)
      # @param {Object} default
      # @yield [m, k]
      # @yieldparam {Helpers::LeetCode::TreeMap<Comparable, Object>} m
      # @yieldparam {Comparable} k
      # @yieldreturn {Object}
      def initialize(default = nil, &block)
        super(Containers::RBTreeMap.new)
        self.default = block || ->(m, k) { default }
      end

      # @param {Comparable} k
      # @return {Object}
      def [](k)
        if key?(k)
          __getobj__[k]
        else
          default.call(self, k)
        end
      end

      # @yield [k, v]
      # @yieldparam {Comparable} k
      # @yieldparam {Object} v
      # @return {Helpers::LeetCode::TreeMap, Enumerator<Array(Comparable, Object)>}
      def each(&block)
        block ? __getobj__.each(&block) : to_enum
      end

      # @param {Comparable} k
      # @return {Boolean}
      def key?(k)
        __getobj__.has_key?(k)
      end

      private

      attr_accessor(:default)
    end
  end
end
