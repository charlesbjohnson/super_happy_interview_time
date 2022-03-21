# frozen_string_literal: true

module LeetCode
  # 844. Backspace String Compare
  module LC844
    # Description:
    # Given two strings s and t, return true if they are equal when both are typed into empty text editors.
    # '#' means a backspace character.
    #
    # Note that after backspacing an empty text, the text will continue empty.
    #
    # Follow up: Can you solve it in O(n) time and O(1) space?
    #
    # Examples:
    # Input: s = "ab#c", t = "ad#c"
    # Output: true
    #
    # Input: s = "ab##", t = "c#d#"
    # Output: true
    #
    # Input: s = "a#c", t = "b"
    # Output: false
    #
    # @param {String} s
    # @param {String} t
    # @return {Boolean}
    def backspace_compare(s, t)
      result = private_methods.grep(/^backspace_compare_\d+$/).map { |m| send(m, s, t) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def backspace_compare_1(s, t)
      s_stack = []
      t_stack = []

      s.each_char { |c|
        if c == "#"
          s_stack.pop
        else
          s_stack.push(c)
        end
      }

      t.each_char { |c|
        if c == "#"
          t_stack.pop
        else
          t_stack.push(c)
        end
      }

      s_stack.join == t_stack.join
    end

    def backspace_compare_2(s, t)
      i = s.length - 1
      j = t.length - 1

      while i >= 0 || j >= 0
        i_back = 0
        j_back = 0

        while i >= 0 && (s[i] == "#" || i_back > 0)
          if s[i] == "#"
            i_back += 1
            i -= 1
          elsif i_back > 0
            i_back -= 1
            i -= 1
          end
        end

        while j >= 0 && (t[j] == "#" || j_back > 0)
          if t[j] == "#"
            j_back += 1
            j -= 1
          elsif j_back > 0
            j_back -= 1
            j -= 1
          end
        end

        break if i < 0 && j < 0
        return false if (i >= 0 && j < 0) || (i < 0 && j >= 0) || s[i] != t[j]

        i -= 1
        j -= 1
      end

      true
    end
  end
end
