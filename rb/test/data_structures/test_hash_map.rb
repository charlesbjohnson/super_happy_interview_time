# typed: false
# frozen_string_literal: true

require("config")
require("data_structures/hash_map")

describe(DataStructures::HashMap) do
  subject { DataStructures::HashMap.new }

  it { _(subject).must_respond_to(:size) }
  it { _(subject).must_respond_to(:each) }
  it { _(subject).must_respond_to(:get) }
  it { _(subject).must_respond_to(:put) }
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
        1000.times { |i| subject.put(i, i.to_s) }

        1000.times { |i| _(subject.get(i)).must_equal(i.to_s) }
        _(subject.size).must_equal(1000)
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
  end

  describe("#each") do
    it("yields each key value pair") do
      expected = [[:a, 1], [:b, 2], [:c, 3]]
      expected.each { |key, value| subject.put(key, value) }

      _(subject.each).must_be_kind_of(Enumerator)

      actual = []
      subject.each { |pair| actual << pair }
      _(actual.sort).must_equal(expected.sort)
    end
  end
end
