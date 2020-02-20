# typed: true
# frozen_string_literal: true

module CTCI
  module C11
    module P1
      # You are given two sorted arrays, A and B, where A has a large enough
      # buffer at the end to hold B. Write a method to merge B into A in sorted
      # order.
      def merge_sorted_order(a, b)
        return [] if a.empty? && b.empty?
        return a if b.empty?
        return b if a.empty?

        a_i = a.find_index(&:nil?).pred
        b_i = b.size.pred
        cursor_i = a.size.pred
        until a_i.negative? || b_i.negative?
          a_v = a[a_i]
          b_v = b[b_i]

          if a_v > b_v
            a[cursor_i] = a_v
            a_i -= 1
          else
            a[cursor_i] = b_v
            b_i -= 1
          end

          cursor_i -= 1
        end

        until b_i.negative?
          a[cursor_i] = b[b_i]
          b_i -= 1
          cursor_i -= 1
        end

        a
      end
    end
  end
end
