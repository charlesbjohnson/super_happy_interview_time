# typed: strong
# frozen_string_literal: true

require("sorbet-runtime")
require("set")

module DCP
  # 1. Two Sum
  module DCP1
    extend(T::Sig)
    # Description:
    # Given a list of numbers and a number k, return whether any two numbers from the list add up to k.
    #
    # Examples:
    # Input: list = [10, 15, 3, 7], target = 17
    # Output: true
    #
    sig { params(list: T::Array[Integer], target: Integer).returns(T::Boolean) }
    def two_sum?(list, target)
      seen = Set.new

      list.each { |value|
        return true if seen.include?(target - value)

        seen.add(value)
      }

      false
    end
  end
end
