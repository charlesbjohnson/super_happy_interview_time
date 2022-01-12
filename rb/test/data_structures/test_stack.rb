# frozen_string_literal: true

require("config")
require("data_structures/stack")

describe(DataStructures::Stack) {
  subject { DataStructures::Stack.new }

  it { _(subject).must_respond_to(:size) }
  it { _(subject).must_respond_to(:each) }
  it { _(subject).must_respond_to(:peek) }
  it { _(subject).must_respond_to(:push) }
  it { _(subject).must_respond_to(:pop) }

  let(:foo) { "foo" }

  it("starts out empty") {
    _(subject.size).must_equal(0)
    _(subject).must_be(:empty?)
  }

  describe("#push") {
    it("adds to the stack") {
      subject.push(foo)
      _(subject.peek).must_equal(foo)
      _(subject.size).must_equal(1)
    }

    it("adds to the top") {
      subject.push("baz")
      subject.push("bar")
      subject.push(foo)

      _(subject.peek).must_equal(foo)
      _(subject.size).must_equal(3)
    }

    it("returns what was pushed") {
      _(subject.push(foo)).must_equal(foo)
    }
  }

  describe("#peek") {
    it("returns the item at the top") {
      subject.push("bar")
      subject.push(foo)

      _(subject.peek).must_equal(foo)
    }

    it("does not remove the item") {
      subject.push(foo)
      subject.peek

      _(subject.size).must_equal(1)
    }

    it("returns nil if empty") {
      _(subject.peek).must_be_nil
    }
  }

  describe("#pop") {
    it("returns the item at the top") {
      subject.push("bar")
      subject.push(foo)

      _(subject.pop).must_equal(foo)
    }

    it("removes the item") {
      subject.push(foo)
      subject.pop

      _(subject.size).must_equal(0)
    }

    it("returns nil if empty") {
      _(subject.pop).must_be_nil
    }

    describe("multiple") {
      it("returns nil every time") {
        3.times { _(subject.pop).must_be_nil }
      }
    }
  }

  describe("#each") {
    it("yields each item") {
      expected = %w[foo bar baz]
      expected.reverse_each { |item| subject.push(item) }

      _(subject.each).must_be_kind_of(Enumerator)

      actual = []
      subject.each { |item| actual << item }
      _(actual).must_equal(expected)
    }
  }
}
