# frozen_string_literal: true

module CTCI
  module C7
    module P4
      # Write methods to implement the multiply, subtract, and divide
      # operations for integers. Use only the add operator.

      def add(i)
        self + i
      end

      def negate
        increment = negative? ? 1 : -1
        tmp = self
        negated = 0
        until tmp.zero?
          tmp = tmp.add(increment)
          negated = negated.add(increment)
        end

        negated
      end

      def subtract(i)
        add(i.negate)
      end

      def multiply(i)
        a = self
        b = i

        result = 0
        count = b
        until count.zero?
          count = b.negative? ? count.add(1) : count.subtract(1)
          result = result.add(a)
        end

        b.negative? ? result.negate : result
      end

      def divide(i)
        raise("Divide by zero") if i.zero?

        a = self
        b = i
        negate_quotient = false

        if a.negative?
          a = a.negate
          negate_quotient = !negate_quotient
        end

        if b.negative?
          b = b.negate
          negate_quotient = !negate_quotient
        end

        result = 0
        until b > a
          a = a.subtract(b)
          result = result.add(1)
        end

        negate_quotient ? result.negate : result
      end
    end
  end
end
