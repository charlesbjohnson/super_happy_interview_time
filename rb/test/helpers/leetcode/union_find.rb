# frozen_string_literal: true

module Helpers
  module LeetCode
    class UnionFind
      include(Enumerable)

      # @param {Integer} n
      def initialize(n)
        self.roots = Array.new(n) { |i| i }
        self.ranks = Array.new(n, 1)
      end

      # @param {Integer} i
      # @param {Integer} j
      # @return {Boolean}
      def connected?(i, j)
        find(i) == find(j)
      end

      # @yield [v]
      # @yieldparam {Integer} v
      # @return {Helpers::LeetCode::UnionFind, Enumerator<Integer>}
      def each(&block)
        roots.each(&block)
      end

      # @param {Integer} i
      # @return {Integer}
      def find(i)
        root = i

        root = roots[root] while root != roots[root]
        i, roots[i] = roots[i], root while i != roots[i]

        root
      end

      # @param {Integer} i
      # @param {Integer} j
      # @return {Boolean}
      def union(i, j)
        i = find(i)
        j = find(j)

        return false if i == j

        case ranks[i] <=> ranks[j]
        when -1
          roots[i] = j
        when 1
          roots[j] = i
        when 0
          roots[j] = i
          ranks[j] += 1
        end

        true
      end

      private

      attr_accessor(:roots, :ranks)
    end
  end
end
