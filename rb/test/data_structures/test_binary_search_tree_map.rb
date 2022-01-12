# frozen_string_literal: true

require("config")
require("data_structures/binary_search_tree_map")

describe(DataStructures::BinarySearchTreeMap) {
  subject { DataStructures::BinarySearchTreeMap.new }

  it { _(subject).must_respond_to(:size) }
  it { _(subject).must_respond_to(:each) }
  it { _(subject).must_respond_to(:get) }
  it { _(subject).must_respond_to(:min) }
  it { _(subject).must_respond_to(:max) }
  it { _(subject).must_respond_to(:put) }
  it { _(subject).must_respond_to(:delete_min) }
  it { _(subject).must_respond_to(:delete_max) }
  it { _(subject).must_respond_to(:delete) }

  let(:key) { :key }
  let(:val) { "val" }

  it("starts out empty") {
    _(subject.size).must_equal(0)
  }

  describe("#get") {
    it("returns nil for nonexistent key") {
      _(subject.get(key)).must_be_nil
    }
  }

  describe("#min") {
    it("returns the key value pair with the smallest key") {
      a = :a
      b = :b
      subject.put(b, b.to_s)
      subject.put(a, a.to_s)
      subject.put(key, val)

      _(subject.min).must_equal([a, a.to_s])
    }

    describe("empty") {
      it("returns nil") {
        _(subject.min).must_be_nil
      }
    }
  }

  describe("#max") {
    it("returns the key value pair with the largest key") {
      a = :a
      b = :b
      subject.put(b, b.to_s)
      subject.put(a, a.to_s)
      subject.put(key, val)

      _(subject.max).must_equal([key, val])
    }

    describe("empty") {
      it("returns nil") {
        _(subject.max).must_be_nil
      }
    }
  }

  describe("#put") {
    it("sets the value for a key") {
      subject.put(key, val)

      _(subject.get(key)).must_equal(val)
      _(subject.size).must_equal(1)
    }

    describe("existing key") {
      it("changes the value for the key") {
        subject.put(key, "foo")
        subject.put(key, val)

        _(subject.get(key)).must_equal(val)
        _(subject.size).must_equal(1)
      }
    }

    describe("multiple") {
      it("sets the value for each key") {
        a = :a
        b = :b
        subject.put(b, b.to_s)
        subject.put(a, a.to_s)
        subject.put(key, val)

        _(subject.get(a)).must_equal(a.to_s)
        _(subject.get(b)).must_equal(b.to_s)
        _(subject.get(key)).must_equal(val)
        _(subject.size).must_equal(3)
      }
    }
  }

  describe("#delete_min") {
    it("deletes the item with the smallest key") {
      a = :a
      b = :b
      subject.put(b, b.to_s)
      subject.put(a, a.to_s)
      subject.put(key, val)

      subject.delete_min

      _(subject.get(b)).must_equal(b.to_s)
      _(subject.get(key)).must_equal(val)
      _(subject.get(a)).must_be_nil
      _(subject.size).must_equal(2)
    }

    describe("multiple") {
      it("deletes the items with the smallest keys") {
        a = :a
        b = :b
        subject.put(b, b.to_s)
        subject.put(a, a.to_s)
        subject.put(key, val)

        subject.delete_min
        subject.delete_min

        _(subject.get(key)).must_equal(val)
        _(subject.get(b)).must_be_nil
        _(subject.get(a)).must_be_nil
        _(subject.size).must_equal(1)
      }
    }

    describe("empty") {
      it("does nothing") {
        subject.delete_min
        _(subject.size).must_equal(0)
      }
    }

    describe("single") {
      it("deletes the only item") {
        subject.put(key, val)

        subject.delete_min

        _(subject.get(key)).must_be_nil
        _(subject.size).must_equal(0)
      }
    }

    describe("unbalanced") {
      it("deletes the item with the smallest key") {
        a = :a
        b = :b
        subject.put(a, a.to_s)
        subject.put(b, b.to_s)
        subject.put(key, val)

        subject.delete_min

        _(subject.get(b)).must_equal(b.to_s)
        _(subject.get(key)).must_equal(val)
        _(subject.get(a)).must_be_nil
        _(subject.size).must_equal(2)
      }
    }
  }

  describe("#delete_max") {
    it("deletes the item with the largest key") {
      a = :a
      b = :b
      subject.put(b, b.to_s)
      subject.put(a, a.to_s)
      subject.put(key, val)

      subject.delete_max

      _(subject.get(a)).must_equal(a.to_s)
      _(subject.get(b)).must_equal(b.to_s)
      _(subject.get(key)).must_be_nil
      _(subject.size).must_equal(2)
    }

    describe("multiple") {
      it("deletes the items with the largest keys") {
        a = :a
        b = :b
        subject.put(b, b.to_s)
        subject.put(a, a.to_s)
        subject.put(key, val)

        subject.delete_max
        subject.delete_max

        _(subject.get(a)).must_equal(a.to_s)
        _(subject.get(b)).must_be_nil
        _(subject.get(key)).must_be_nil
        _(subject.size).must_equal(1)
      }
    }

    describe("empty") {
      it("does nothing") {
        subject.delete_max
        _(subject.size).must_equal(0)
      }
    }

    describe("single") {
      it("deletes the only item") {
        subject.put(key, val)

        subject.delete_max

        _(subject.get(key)).must_be_nil
        _(subject.size).must_equal(0)
      }
    }

    describe("unbalanced") {
      it("deletes the item with the largest key") {
        a = :a
        b = :b
        subject.put(a, a.to_s)
        subject.put(b, b.to_s)
        subject.put(key, val)

        subject.delete_max

        _(subject.get(a)).must_equal(a.to_s)
        _(subject.get(b)).must_equal(b.to_s)
        _(subject.get(key)).must_be_nil
        _(subject.size).must_equal(2)
      }
    }
  }

  describe("#delete") {
    it("deletes the item with the matching key") {
      a = :a
      b = :b
      subject.put(b, b.to_s)
      subject.put(a, a.to_s)
      subject.put(key, val)

      subject.delete(a)

      _(subject.get(b)).must_equal(b.to_s)
      _(subject.get(key)).must_equal(val)
      _(subject.get(a)).must_be_nil
      _(subject.size).must_equal(2)
    }

    describe("multiple") {
      it("deletes the items with the matching keys") {
        a = :a
        b = :b
        subject.put(b, b.to_s)
        subject.put(a, a.to_s)
        subject.put(key, val)

        subject.delete(b)
        subject.delete(a)

        _(subject.get(key)).must_equal(val)
        _(subject.get(b)).must_be_nil
        _(subject.get(a)).must_be_nil
        _(subject.size).must_equal(1)
      }
    }

    describe("with nonexistent key") {
      it("does nothing") {
        subject.delete(:a)
        _(subject.size).must_equal(0)
      }
    }

    describe("empty") {
      it("does nothing") {
        subject.put(key, val)

        subject.delete(:a)

        _(subject.get(key)).must_equal(val)
        _(subject.size).must_equal(1)
      }
    }

    describe("single") {
      it("deletes the only item with the matching key") {
        subject.put(key, val)

        subject.delete(key)

        _(subject.get(key)).must_be_nil
        _(subject.size).must_equal(0)
      }
    }

    describe("unbalanced") {
      it("deletes the item with the matching key") {
        a = :a
        b = :b
        subject.put(a, a.to_s)
        subject.put(b, b.to_s)
        subject.put(key, val)

        subject.delete(a)

        _(subject.get(b)).must_equal(b.to_s)
        _(subject.get(key)).must_equal(val)
        _(subject.get(a)).must_be_nil
        _(subject.size).must_equal(2)
      }
    }
  }

  describe("#each") {
    it("yields each key value pair inorder by default") {
      expected = [[:a, 1], [:b, 2], [:c, 3]].shuffle
      expected.each { |key, value| subject.put(key, value) }

      _(subject.each).must_be_kind_of(Enumerator)

      actual = []
      subject.each { |pair| actual << pair }
      _(actual).must_equal(expected.sort)
    }

    it("yields each key value pair preorder") {
      expected = [[:b, 2], [:a, 1], [:c, 3]]
      expected.each { |key, value| subject.put(key, value) }

      _(subject.each).must_be_kind_of(Enumerator)

      actual = []
      subject.each(:pre) { |pair| actual << pair }
      _(actual).must_equal(expected)
    }

    it("yields each key value pair postorder") {
      add = [[:b, 2], [:a, 1], [:c, 3]]
      add.each { |key, value| subject.put(key, value) }

      _(subject.each).must_be_kind_of(Enumerator)

      actual = []
      subject.each(:post) { |pair| actual << pair }
      _(actual).must_equal([[:a, 1], [:c, 3], [:b, 2]])
    }
  }
}
