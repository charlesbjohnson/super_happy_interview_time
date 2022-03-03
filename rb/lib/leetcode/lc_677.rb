# frozen_string_literal: true

module LeetCode
  # 677. Map Sum Pairs
  module LC677
    # Description:
    # Design a map that allows you to do the following:
    # - Maps a string key to a given value.
    # - Returns the sum of the values that have a key with a prefix equal to a given string.
    #
    # Implement the MapSum class:
    # - MapSum()                         Initializes the MapSum object.
    # - void insert(String key, int val) Inserts the key-val pair into the map.
    #                                    If the key already existed, the original key-value pair will be overridden to the new one.
    # - int sum(string prefix)           Returns the sum of all the pairs' value whose key starts with the prefix.
    #
    # Examples:
    # Input:
    # ["MapSum", "insert", "sum", "insert", "sum"]
    # [[], ["apple", 3], ["ap"], ["app", 2], ["ap"]]
    # Output:
    # [null, null, 3, null, 5]
    #
    class MapSum
      def initialize
        self.root = TrieNode.new
      end

      # @param {String} key
      # @param {Integer} val
      # @return {nil}
      def insert(key, val)
        cursor = root

        key.each_char { |c| cursor = cursor.children[c] }
        cursor.value = val

        nil
      end

      # @param {String} key
      # @return {Integer}
      def sum(prefix)
        cursor = root

        prefix.each_char { |c|
          if !cursor.children.key?(c)
            return 0
          else
            cursor = cursor.children[c]
          end
        }

        rec = ->(cursor) {
          cursor.value + cursor.children.sum { |_, child| rec.call(child) }
        }

        rec.call(cursor)
      end

      private

      attr_accessor(:root)

      TrieNode = Struct.new(:value, :children) {
        def initialize(value = 0, children = Hash.new { |h, k| h[k] = TrieNode.new })
          super
        end
      }
    end
  end
end
