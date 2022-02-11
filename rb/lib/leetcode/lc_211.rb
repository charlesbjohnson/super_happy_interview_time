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
        r_search(root, 0, word)
      end

      private

      attr_accessor(:root)

      def r_search(node, i, word)
        return node.terminal if i == word.length
        return false if node.max_depth < word.length - i

        if word[i] == "."
          node.children.any? { |_, child| r_search(child, i + 1, word) }
        elsif !node.children.key?(word[i])
          false
        else
          r_search(node.children[word[i]], i + 1, word)
        end
      end

      TrieNode = Struct.new(:terminal, :max_depth, :children) {
        def initialize(terminal = false, max_depth = 1, children = Hash.new { |h, k| h[k] = TrieNode.new })
          super
        end
      }
    end
  end
end
