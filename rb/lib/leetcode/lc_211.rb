# frozen_string_literal: true

module LeetCode
  # 211. Design Add and Search Words Data Structure
  module LC211
    # Description:
    # Design a data structure that supports adding new words and finding if a string matches any previously added string.
    #
    # Implement the WordDictionary class:
    # - WordDictionary()   Initializes the object.
    # - void addWord(word) Adds word to the data structure, it can be matched later.
    # - bool search(word)  Returns true if there is any string in the data structure that matches word or false otherwise.
    #                      word may contain dots '.' where dots can be matched with any letter.
    #
    # Examples:
    # Input:
    # ["WordDictionary", "addWord", "addWord", "addWord", "search", "search", "search", "search"]
    # [[], ["bad"], ["dad"], ["mad"], ["pad"], ["bad"], [".ad"], ["b.."]]
    # Output:
    # [null, null, null, null, false, true, true, true]
    #
    class WordDictionary
      def initialize
        self.root = TrieNode.new
      end

      # @param {String} word
      # @return {nil}
      def add_word(word)
        cursor = root

        word.each_char.with_index { |c, i|
          cursor = cursor.children[c]
          cursor.max_depth = [cursor.max_depth, word.length - i].max
        }

        cursor.terminal = true
        root.max_depth = [root.max_depth, word.length].max

        nil
      end

      # @param {String} word
      # @return {Boolean}
      def search(word)
        rec = ->(cursor, i) {
          return cursor.terminal if i == word.length
          return false if cursor.max_depth < word.length - i

          if word[i] == "."
            cursor.children.any? { |_, child| rec.call(child, i + 1) }
          elsif !cursor.children.key?(word[i])
            false
          else
            rec.call(cursor.children[word[i]], i + 1)
          end
        }

        rec.call(root, 0)
      end

      private

      attr_accessor(:root)

      TrieNode = Struct.new(:terminal, :max_depth, :children) {
        def initialize(terminal = false, max_depth = 1, children = Hash.new { |h, k| h[k] = TrieNode.new })
          super
        end
      }
    end
  end
end
