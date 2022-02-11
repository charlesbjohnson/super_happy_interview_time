# frozen_string_literal: true

module LeetCode
  # 648. Replace Words
  module LC648
    # Description:
    # In English, we have a concept called root, which can be followed by some other word to form another longer word - let's call this word successor.
    # For example, when the root "an" is followed by the successor word "other", we can form a new word "another".
    #
    # Given a dictionary consisting of many roots and a sentence consisting of words separated by spaces, replace all the successors in the sentence with the root forming it.
    # If a successor can be replaced by more than one root, replace it with the root that has the shortest length.
    #
    # Return the sentence after the replacement.
    #
    # Examples:
    # Input: dictionary = ["cat", "bat", "rat"], sentence = "the cattle was rattled by the battery"
    # Output: "the cat was rat by the bat"
    #
    # Input: dictionary = ["a", "b", "c"], sentence = "aadsfasf absbs bbab cadsfafs"
    # Output: "a a b c"
    #
    # @param {Array<String>} dictionary
    # @param {String} sentence
    # @return {String}
    def replace_words(dictionary, sentence)
      trie = Trie.new

      dictionary.each { |root|
        trie.insert(root)
      }

      sentence.split(" ").map { |word|
        root = trie.search(word)
        root == "" ? word : root
      }.join(" ")
    end

    class Trie
      def initialize
        self.root = TrieNode.new
      end

      # @param {String} s
      # @return {nil}
      def insert(s)
        cursor = root

        s.each_char { |c| cursor = cursor.children[c] }
        cursor.terminal = true

        nil
      end

      # @param {String} s
      # @return {String}
      def search(s)
        result = ""

        cursor = root
        i = 0

        while i < s.length && !cursor.terminal
          return "" if !cursor.children.key?(s[i])

          result += s[i]
          cursor = cursor.children[s[i]]

          i += 1
        end

        result
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
