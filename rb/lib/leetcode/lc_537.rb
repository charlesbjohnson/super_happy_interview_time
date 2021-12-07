# frozen_string_literal: true

module LeetCode
  # 537. Complex Number Multiplication
  module LC537
    ComplexNumber = Struct.new(:real, :imaginary) {
      def self.parse(s)
        new(*s[0..-2].split("+").map(&:to_i))
      end

      def self.mul(left, right)
        imaginary = (left.real * right.imaginary) + (left.imaginary * right.real)

        real = left.real * right.real
        real += (left.imaginary * right.imaginary) * -1 if !left.imaginary.zero? && !right.imaginary.zero?

        ComplexNumber.new(real, imaginary)
      end

      def to_s
        "#{real}+#{imaginary}i"
      end
    }

    # Description:
    # Given two strings representing two complex numbers, return a string representing their multiplication.
    #
    # Examples:
    # - 1:
    #   Input: left = "1+1i", right = "1+1i"
    #   Output: "0+2i"
    #   Explanation: (1 + i) * (1 + i) = 1 + i2 + 2 * i = 2i, and you need convert it to the form of 0+2i.
    #
    # - 2:
    #   Input: left = "1+-1i", right = "1+-1i"
    #   Output: "0+-2i"
    #   Explanation: (1 - i) * (1 - i) = 1 + i2 - 2 * i = -2i, and you need convert it to the form of 0+-2i.
    #
    # Notes:
    # - i^2 == -1 according to the definition.
    # - The input strings will not have additional whitespace.
    # - 0 The input strings will be given in the form of a+bi,
    #   where the integer a and b will both belong to the range of [-100, 100].
    #   The output should be also in this form.
    #
    # @param left {String}
    # @param right {String}
    # @return {String}
    def complex_number_multiply(left, right)
      ComplexNumber.mul(
        ComplexNumber.parse(left),
        ComplexNumber.parse(right)
      ).to_s
    end
  end
end
