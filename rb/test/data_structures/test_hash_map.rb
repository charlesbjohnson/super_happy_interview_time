# frozen_string_literal: true

require("config")
require("data_structures/hash_map")

describe(DataStructures::HashMap) {
  subject { DataStructures::HashMap.new }

  it { _(subject).must_respond_to(:size) }
  it { _(subject).must_respond_to(:each) }
  it { _(subject).must_respond_to(:get) }
  it { _(subject).must_respond_to(:put) }
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
        1000.times { |i| subject.put(i, i.to_s) }

        1000.times { |i| _(subject.get(i)).must_equal(i.to_s) }
        _(subject.size).must_equal(1000)
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
  }

  describe("#each") {
    it("yields each key value pair") {
      expected = [[:a, 1], [:b, 2], [:c, 3]]
      expected.each { |key, value| subject.put(key, value) }

      _(subject.each).must_be_kind_of(Enumerator)

      actual = []
      subject.each { |pair| actual << pair }
      _(actual.sort).must_equal(expected.sort)
    }
  }
}
