# frozen_string_literal: true

module LeetCode
  # 599. Minimum Index Sum of Two Lists
  module LC599
    # Description:
    # Suppose Andy and Doris want to choose a restaurant for dinner, and they both have a list of favorite restaurants represented by strings.
    # You need to help them find out their common interest with the least list index sum.
    #
    # If there is a choice tie between answers, output all of them with no order requirement.
    # You could assume there always exists an answer.
    #
    # Examples:
    # Input: list1 = ["Shogun", "Tapioca Express", "Burger King", "KFC"], list2 = ["Piatti", "The Grill at Torrey Pines", "Hungry Hunter Steakhouse", "Shogun"]
    # Output: ["Shogun"]
    #
    # Input: list1 = ["Shogun", "Tapioca Express", "Burger King", "KFC"], list2 = ["KFC", "Shogun", "Burger King"]
    # Output: ["Shogun"]
    #
    # @param {Array<String>} list1
    # @param {Array<String>} list2
    # @return {Array<String>}
    def find_restaurant(list1, list2)
      hash = {}

      min = Float::INFINITY
      common = []

      list1.each_with_index { |v, i| hash[v] = i }

      list2.each_with_index { |v, i|
        if hash.key?(v)
          if hash[v] + i < min
            min = hash[v] + i
            common = [v]
          elsif hash[v] + i == min
            common.push(v)
          end
        end
      }

      common
    end
  end
end
