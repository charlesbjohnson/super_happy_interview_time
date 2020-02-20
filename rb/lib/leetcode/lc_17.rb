# typed: true
# frozen_string_literal: true

module LeetCode
  # 17. Letter Combinations of a Phone Number
  module LC17
    MAPPING = {
      '0' => [],
      '1' => [],
      '2' => %w[a b c],
      '3' => %w[d e f],
      '4' => %w[g h i],
      '5' => %w[j k l],
      '6' => %w[m n o],
      '7' => %w[p q r s],
      '8' => %w[t u v],
      '9' => %w[w x y z]
    }.freeze

    # Description:
    # Given a digit string, return all possible letter combinations that the number could represent.
    # A mapping of digit to letters (just like on the telephone buttons) is given below.
    #
    # 1 => "",     2 => "abc", 3 => "def"
    # 4 => "ghi",  5 => "jkl", 6 => "mno"
    # 7 => "pqrs", 8 => "tuv"  9 => "wxyz"
    #              0 => ""
    #
    # Examples:
    # Input: "23"
    # Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
    #
    # Notes:
    # - Although the above answer is in lexicographical order, your answer could be in any order you want.
    #
    # @param digits {String}
    # @return {Array<String>}
    def letter_combinations(digits)
      digits.chars.reduce([]) do |combinations, digit|
        mapping = MAPPING[digit].clone

        if combinations.empty?
          combinations.concat(mapping)
          next combinations
        end

        combinations.flat_map do |combination|
          mapping.map { |character| combination + character }
        end
      end
    end
  end
end
