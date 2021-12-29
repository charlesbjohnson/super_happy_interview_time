# frozen_string_literal: true

require("config")
require("helpers/leetcode/binary_tree")

require("leetcode/lc_297")

module LeetCode
  class TestLC297 < Minitest::Test
    include(Helpers::LeetCode::BinaryTree)
    include(LC297)

    [
      [[], ""],
      [[1], "1"],
      [[1, 2], "1,2"],
      [[1, 2, 3], "1,2,3"],
      [[1, nil, 3], "1,,3"],
      [[1, nil, 3, nil, 4], "1,,3,,4"],
      [[1, 2, 3, nil, nil, 4, 5], "1,2,3,,,4,5"]
    ].each.with_index { |(root, expected), i|
      define_method(:"test_serialize_deserialize_#{i}") {
        root = build_binary_tree(root)

        serialized = serialize(root)
        deserialized = deserialize(serialized)

        assert_equal(expected, serialized)

        if expected != ""
          assert_equal(root, deserialized)
        else
          assert_nil(deserialized)
        end
      }
    }
  end
end
