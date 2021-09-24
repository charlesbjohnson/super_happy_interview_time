# typed: false
# frozen_string_literal: true

require("config")
require("data_structures/binary_search_tree_map")

describe(DataStructures::BinarySearchTreeMap) do
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

  it("starts out empty") do
    _(subject.size).must_equal(0)
  end

  describe("#get") do
    it("returns nil for nonexistent key") do
      _(subject.get(key)).must_be_nil
    end
  end

  describe("#min") do
    it("returns the key value pair with the smallest key") do
      a = :a
      b = :b
      subject.put(b, b.to_s)
      subject.put(a, a.to_s)
      subject.put(key, val)

      _(subject.min).must_equal([a, a.to_s])
    end

    describe("empty") do
      it("returns nil") do
        _(subject.min).must_be_nil
      end
    end
  end

  describe("#max") do
    it("returns the key value pair with the largest key") do
      a = :a
      b = :b
      subject.put(b, b.to_s)
      subject.put(a, a.to_s)
      subject.put(key, val)

      _(subject.max).must_equal([key, val])
    end

    describe("empty") do
      it("returns nil") do
        _(subject.max).must_be_nil
      end
    end
  end

  describe("#put") do
    it("sets the value for a key") do
      subject.put(key, val)

      _(subject.get(key)).must_equal(val)
      _(subject.size).must_equal(1)
    end

    describe("existing key") do
      it("changes the value for the key") do
        subject.put(key, "foo")
        subject.put(key, val)

        _(subject.get(key)).must_equal(val)
        _(subject.size).must_equal(1)
      end
    end

    describe("multiple") do
      it("sets the value for each key") do
        a = :a
        b = :b
        subject.put(b, b.to_s)
        subject.put(a, a.to_s)
        subject.put(key, val)

        _(subject.get(a)).must_equal(a.to_s)
        _(subject.get(b)).must_equal(b.to_s)
        _(subject.get(key)).must_equal(val)
        _(subject.size).must_equal(3)
      end
    end
  end

  describe("#delete_min") do
    it("deletes the item with the smallest key") do
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
    end

    describe("multiple") do
      it("deletes the items with the smallest keys") do
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
      end
    end

    describe("empty") do
      it("does nothing") do
        subject.delete_min
        _(subject.size).must_equal(0)
      end
    end

    describe("single") do
      it("deletes the only item") do
        subject.put(key, val)

        subject.delete_min

        _(subject.get(key)).must_be_nil
        _(subject.size).must_equal(0)
      end
    end

    describe("unbalanced") do
      it("deletes the item with the smallest key") do
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
      end
    end
  end

  describe("#delete_max") do
    it("deletes the item with the largest key") do
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
    end

    describe("multiple") do
      it("deletes the items with the largest keys") do
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
      end
    end

    describe("empty") do
      it("does nothing") do
        subject.delete_max
        _(subject.size).must_equal(0)
      end
    end

    describe("single") do
      it("deletes the only item") do
        subject.put(key, val)

        subject.delete_max

        _(subject.get(key)).must_be_nil
        _(subject.size).must_equal(0)
      end
    end

    describe("unbalanced") do
      it("deletes the item with the largest key") do
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
      end
    end
  end

  describe("#delete") do
    it("deletes the item with the matching key") do
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
    end

    describe("multiple") do
      it("deletes the items with the matching keys") do
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
      end
    end

    describe("with nonexistent key") do
      it("does nothing") do
        subject.delete(:a)
        _(subject.size).must_equal(0)
      end
    end

    describe("empty") do
      it("does nothing") do
        subject.put(key, val)

        subject.delete(:a)

        _(subject.get(key)).must_equal(val)
        _(subject.size).must_equal(1)
      end
    end

    describe("single") do
      it("deletes the only item with the matching key") do
        subject.put(key, val)

        subject.delete(key)

        _(subject.get(key)).must_be_nil
        _(subject.size).must_equal(0)
      end
    end

    describe("unbalanced") do
      it("deletes the item with the matching key") do
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
      end
    end
  end

  describe("#each") do
    it("yields each key value pair inorder by default") do
      expected = [[:a, 1], [:b, 2], [:c, 3]].shuffle
      expected.each { |key, value| subject.put(key, value) }

      _(subject.each).must_be_kind_of(Enumerator)

      actual = []
      subject.each { |pair| actual << pair }
      _(actual).must_equal(expected.sort)
    end

    it("yields each key value pair preorder") do
      expected = [[:b, 2], [:a, 1], [:c, 3]]
      expected.each { |key, value| subject.put(key, value) }

      _(subject.each).must_be_kind_of(Enumerator)

      actual = []
      subject.each(:pre) { |pair| actual << pair }
      _(actual).must_equal(expected)
    end

    it("yields each key value pair postorder") do
      add = [[:b, 2], [:a, 1], [:c, 3]]
      add.each { |key, value| subject.put(key, value) }

      _(subject.each).must_be_kind_of(Enumerator)

      actual = []
      subject.each(:post) { |pair| actual << pair }
      _(actual).must_equal([[:a, 1], [:c, 3], [:b, 2]])
    end
  end
end
