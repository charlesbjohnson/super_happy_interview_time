# frozen_string_literal: true

module LeetCode
  # 208. Implement Trie (Prefix Tree)
  module LC208
    # Description:
    # A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings.
    # There are various applications of this data structure, such as autocomplete and spellchecker.
    #
    # Implement the Trie class:
    # - Trie()                            Initializes the trie object.
    # - void insert(String word)          Inserts the string word into the trie.
    # - boolean search(String word)       Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
    # - boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.
    #
    # Examples:
    # Input:
    # ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
    # [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
    # Output:
    # [null, null, true, false, true, null, true]
    #
    class Trie
      def initialize
        self.root = TrieNode.new
      end

      # @param {String} word
      # @return {nil}
      def insert(word)
        cursor = root

        word.each_char { |c| cursor = cursor.children[c] }
        cursor.terminal = true

        nil
      end

      # @param {String} word
      # @return {Boolean}
      def search(word)
        cursor = root

        word.each_char { |c|
          if !cursor.children.key?(c)
            return false
          else
            cursor = cursor.children[c]
          end
        }

        cursor.terminal
      end

      # @param {String} prefix
      # @return {Boolean}
      def starts_with(prefix)
        cursor = root

        prefix.each_char { |c|
          if !cursor.children.key?(c)
            return false
          else
            cursor = cursor.children[c]
          end
        }

        !cursor.nil?
      end

      private

      attr_accessor(:root)

      TrieNode = Struct.new(:terminal, :children) {
        def initialize(terminal = false, children = Hash.new { |h, k| h[k] = TrieNode.new })
          super
        end
      }
    end
  end
end
