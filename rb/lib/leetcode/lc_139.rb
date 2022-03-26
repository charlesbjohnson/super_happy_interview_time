# frozen_string_literal: true

module LeetCode
  # 139. Word Break
  module LC139
    # Description:
    # Given a string s and a dictionary of strings word_dict,
    # return true if s can be segmented into a space-separated sequence of one or more dictionary words.
    #
    # Note that the same word in the dictionary may be reused multiple times in the segmentation.
    #
    # Examples:
    # Input: s = "leetcode", word_dict = ["leet", "code"]
    # Output: true
    #
    # Input: s = "applepenapple", word_dict = ["apple", "pen"]
    # Output: true
    #
    # Input: s = "catsandog", word_dict = ["cats", "dog", "sand", "and", "cat"]
    # Output: false
    #
    # @param {String} s
    # @param {Array<String>} word_dict
    # @return {Boolean}
    def word_break(s, word_dict)
      result = private_methods.grep(/^word_break_\d+$/).map { |m| send(m, s, word_dict) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def word_break_1(s, word_dict)
      cache = {}

      rec = ->(i) {
        return true if i == s.length

        cache[i] ||= word_dict.any? { |word|
          i + word.length <= s.length && rec.call(i + word.length) && s[i...(i + word.length)] == word
        }
      }

      rec.call(0)
    end

    def word_break_2(s, word_dict)
      cache = Array.new(s.length + 1) { |i| i == s.length }

      (s.length - 1).downto(0) { |i|
        cache[i] = word_dict.any? { |word|
          i + word.length <= s.length && cache[i + word.length] && s[i...(i + word.length)] == word
        }
      }

      cache[0]
    end

    def word_break_3(s, word_dict)
      cache = Array.new(s.length + 1) { |i| i == s.length }
      trie = Trie.new(word_dict)

      (s.length - 1).downto(0) { |i|
        cache[i] = trie.words(s[i..]).any? { |word| cache[i + word.length] }
      }

      cache[0]
    end

    private

    class Trie
      def initialize(words)
        self.root = TrieNode.new

        words.each { |word|
          cursor = root
          word.each_char { |c| cursor = cursor.children[c] }
          cursor.terminal = true
        }
      end

      def words(word)
        result = []

        cursor = root
        i = 0

        while i < word.length && cursor.children.key?(word[i])
          cursor = cursor.children[word[i]]
          result.push(word[..i]) if cursor.terminal
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
