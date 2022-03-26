# frozen_string_literal: true

module LeetCode
  # 904. Fruit Into Baskets
  module LC904
    # Description:
    # You are visiting a farm that has a single row of fruit trees arranged from left to right.
    # The trees are represented by an integer array fruits where fruits[i] is the type of fruit the ith tree produces.
    #
    # You want to collect as much fruit as possible. However, the owner has some strict rules that you must follow:
    # - You only have two baskets, and each basket can only hold a single type of fruit. There is no limit on the amount of fruit each basket can hold.
    # - Starting from any tree of your choice, you must pick exactly one fruit from every tree (including the start tree) while moving to the right. The picked fruits must fit in one of your baskets.
    # - Once you reach a tree with fruit that cannot fit in your baskets, you must stop.
    #
    # Given the integer array fruits, return the maximum number of fruits you can pick.
    #
    # Examples:
    # Input: fruits = [1, 2, 1]
    # Output: 3
    #
    # Input: fruits = [0, 1, 2, 2]
    # Output: 3
    #
    # Input: fruits = [1, 2, 3, 2, 2]
    # Output: 4
    #
    # @param {Array<Integer>} fruits
    # @return {Integer}
    def total_fruit(fruits)
      result = private_methods.grep(/^total_fruit_\d+$/).map { |m| send(m, fruits) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def total_fruit_1(fruits)
      result = -Float::INFINITY

      i = 0
      j = 0

      baskets = Hash.new(0)

      while j < fruits.length
        case baskets.length <=> 2
        when 1
          baskets[fruits[i]] -= 1
          baskets.delete(fruits[i]) if baskets[fruits[i]] == 0
          i += 1
        when -1, 0
          baskets[fruits[j]] += 1
          j += 1
        end

        result = [result, j - i].max if baskets.length <= 2
      end

      result
    end

    def total_fruit_2(fruits)
      result = -Float::INFINITY

      i = 0
      j = 0

      baskets = Hash.new(0)

      while j < fruits.length
        baskets[fruits[j]] += 1
        j += 1

        while baskets.length > 2
          baskets[fruits[i]] -= 1
          baskets.delete(fruits[i]) if baskets[fruits[i]] == 0
          i += 1
        end

        result = [result, j - i].max
      end

      result
    end
  end
end
