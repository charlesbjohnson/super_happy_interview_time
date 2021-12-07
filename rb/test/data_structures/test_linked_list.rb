# frozen_string_literal: true

require("config")
require("data_structures/linked_list")

describe(DataStructures::LinkedList) {
  subject { DataStructures::LinkedList.new }

  it { _(subject).must_respond_to(:size) }
  it { _(subject).must_respond_to(:[]) }
  it { _(subject).must_respond_to(:each) }
  it { _(subject).must_respond_to(:append) }
  it { _(subject).must_respond_to(:insert) }
  it { _(subject).must_respond_to(:remove) }
  it { _(subject).must_respond_to(:delete) }
  it { _(subject).must_respond_to(:index) }

  let(:foo) { "foo" }

  it("starts out empty") do
    _(subject.size).must_equal(0)
    _(subject).must_be(:empty?)
  end

  describe("#append") {
    it("adds to the list") do
      subject.append(foo)
      _(subject[0]).must_equal(foo)
      _(subject.size).must_equal(1)
    end

    it("adds to the end of the list") do
      bar = "bar"
      baz = "baz"
      subject.append(foo)
      subject.append(bar)
      subject.append(baz)

      _(subject[0]).must_equal(foo)
      _(subject[1]).must_equal(bar)
      _(subject[2]).must_equal(baz)
      _(subject.size).must_equal(3)
    end
  }

  describe("#insert") {
    it("adds to the list") do
      subject.insert(0, foo)
      _(subject[0]).must_equal(foo)
      _(subject.size).must_equal(1)
    end

    it("inserts at the end of the list") do
      bar = "bar"
      subject.insert(0, foo)
      subject.insert(1, bar)

      _(subject[0]).must_equal(foo)
      _(subject[1]).must_equal(bar)
    end

    it("inserts at the beginning of the list") do
      bar = "bar"
      subject.insert(0, foo)
      subject.insert(0, bar)

      _(subject[0]).must_equal(bar)
      _(subject[1]).must_equal(foo)
    end

    it("inserts at the middle of the list") do
      bar = "bar"
      baz = "baz"
      subject.insert(0, foo)
      subject.insert(1, bar)
      subject.insert(1, baz)

      _(subject[0]).must_equal(foo)
      _(subject[1]).must_equal(baz)
      _(subject[2]).must_equal(bar)
    end
  }

  describe("#remove") {
    before { subject.append(foo) }

    it("takes away from the list") do
      subject.remove
      _(subject[0]).must_be_nil
      _(subject.size).must_equal(0)
    end

    it("returns the item taken away") do
      removed = subject.remove
      _(removed).must_equal(foo)
    end

    it("removes from the end of the list") do
      bar = "bar"
      subject.append(bar)
      subject.append("baz")

      subject.remove
      _(subject[0]).must_equal(foo)
      _(subject[1]).must_equal(bar)
      _(subject[2]).must_be_nil
    end
  }

  describe("#delete") {
    before { subject.append(foo) }

    it("takes away from the list") do
      subject.delete(0)
      _(subject[0]).must_be_nil
      _(subject.size).must_equal(0)
    end

    it("returns the item taken away") do
      deleted = subject.delete(0)
      _(deleted).must_equal(foo)
    end

    it("deletes from the beginning of the list") do
      bar = "bar"
      subject.append(bar)

      subject.delete(0)
      _(subject[0]).must_equal(bar)
      _(subject[1]).must_be_nil
    end

    it("deletes from the end of the list") do
      subject.append("bar")

      subject.delete(1)
      _(subject[0]).must_equal(foo)
      _(subject[1]).must_be_nil
    end

    it("deletes from the middle of the list") do
      baz = "baz"
      subject.append("bar")
      subject.append(baz)

      subject.delete(1)
      _(subject[0]).must_equal(foo)
      _(subject[1]).must_equal(baz)
      _(subject[2]).must_be_nil
    end
  }

  describe("#each") {
    it("yields each item") do
      expected = %w[foo bar baz]
      expected.each { |item| subject.append(item) }

      _(subject.each).must_be_kind_of(Enumerator)

      actual = []
      subject.each { |item| actual << item }
      _(actual).must_equal(expected)
    end
  }

  describe("#index") {
    it("returns the index where an item appears") do
      subject.append("bar")
      subject.append(foo)
      subject.append("baz")

      _(subject.index(foo)).must_equal(1)
    end

    it("returns nil if item does not exist") do
      _(subject.index(foo)).must_be_nil
    end
  }
}
