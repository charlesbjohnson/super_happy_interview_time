# frozen_string_literal: true

module CTCI
  module C1
    module P8
      # Assume you have a method isSubstring which checks if one word
      # is a substring of another
      # Given two strings, s and t, write code to check if t is a
      # rotation of s using only one call of isSubstring
      # (e.g., "waterbottle" is a rotation of "erbottlewat")
      def rotation?(s, t)
        if (s == "" || t == "") \
            || (s.length != t.length)
          return false
        end

        # I had to look this up, was a teeny bit too tricky for me
        substring?(s * 2, t)
      end

      private

      def substring?(s, t)
        !s[t].nil?
      end
    end
  end
end
