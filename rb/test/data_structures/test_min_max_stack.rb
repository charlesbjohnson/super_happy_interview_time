# frozen_string_literal: true

require("config")
require("data_structures/min_max_stack")

describe(DataStructures::MinMaxStack) {
  subject { DataStructures::MinMaxStack.new }

  it { _(subject).must_respond_to(:size) }
  it { _(subject).must_respond_to(:each) }
  it { _(subject).must_respond_to(:peek) }
  it { _(subject).must_respond_to(:push) }
  it { _(subject).must_respond_to(:pop) }
  it { _(subject).must_respond_to(:min) }
  it { _(subject).must_respond_to(:max) }

  let(:foo) { "foo" }

  it("starts out empty") {
    _(subject.size).must_equal(0)
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

    describe("when the item is not comparable to others in the stack") {
      it("is not added") {
        subject.push(1)
        _(subject.size).must_equal(1)

        subject.push("")
        _(subject.size).must_equal(1)
        _(subject.peek).must_equal(1)
      }

      it("returns nil") {
        subject.push(1)
        _(subject.push("")).must_be_nil
      }
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

  describe("#min") {
    it("returns the minimum item") {
      subject.push(2)
      subject.push(8)
      subject.push(0)

      _(subject.min).must_equal(0)
    }

    it("does not remove any item") {
      subject.push(1)
      subject.push(0)

      subject.min
      _(subject.size).must_equal(2)
    }

    it("returns nil if empty") {
      _(subject.min).must_be_nil
    }

    describe("when the minimum changes") {
      it("changes accordingly") {
        subject.push(2)
        subject.push(8)

        _(subject.min).must_equal(2)

        subject.push(1)
        _(subject.min).must_equal(1)

        subject.pop
        _(subject.min).must_equal(2)
      }
    }
  }

  describe("#max") {
    it("returns the maximum item") {
      subject.push(2)
      subject.push(8)
      subject.push(0)

      _(subject.max).must_equal(8)
    }

    it("does not remove any item") {
      subject.push(1)
      subject.push(0)

      subject.max
      _(subject.size).must_equal(2)
    }

    it("returns nil if empty") {
      _(subject.max).must_be_nil
    }

    describe("when the maximum changes") {
      it("changes accordingly") {
        subject.push(8)
        subject.push(2)

        _(subject.max).must_equal(8)

        subject.push(10)
        _(subject.max).must_equal(10)

        subject.pop
        _(subject.max).must_equal(8)
      }
    }
  }
}
