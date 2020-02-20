# typed: false
# frozen_string_literal: true

require 'config'
require 'data_structures/stack'

describe DataStructures::Stack do
  subject { DataStructures::Stack.new }

  it { _(subject).must_respond_to :size }
  it { _(subject).must_respond_to :each }
  it { _(subject).must_respond_to :peek }
  it { _(subject).must_respond_to :push }
  it { _(subject).must_respond_to :pop }

  let(:foo) { 'foo' }

  it 'starts out empty' do
    _(subject.size).must_equal(0)
    _(subject).must_be :empty?
  end

  describe '#push' do
    it 'adds to the stack' do
      subject.push(foo)
      _(subject.peek).must_equal(foo)
      _(subject.size).must_equal(1)
    end

    it 'adds to the top' do
      subject.push('baz')
      subject.push('bar')
      subject.push(foo)

      _(subject.peek).must_equal(foo)
      _(subject.size).must_equal(3)
    end

    it 'returns what was pushed' do
      _(subject.push(foo)).must_equal(foo)
    end
  end

  describe '#peek' do
    it 'returns the item at the top' do
      subject.push('bar')
      subject.push(foo)

      _(subject.peek).must_equal(foo)
    end

    it 'does not remove the item' do
      subject.push(foo)
      subject.peek

      _(subject.size).must_equal(1)
    end

    it 'returns nil if empty' do
      _(subject.peek).must_be_nil
    end
  end

  describe '#pop' do
    it 'returns the item at the top' do
      subject.push('bar')
      subject.push(foo)

      _(subject.pop).must_equal(foo)
    end

    it 'removes the item' do
      subject.push(foo)
      subject.pop

      _(subject.size).must_equal(0)
    end

    it 'returns nil if empty' do
      _(subject.pop).must_be_nil
    end

    describe 'multiple' do
      it 'returns nil every time' do
        3.times { _(subject.pop).must_be_nil }
      end
    end
  end

  describe '#each' do
    it 'yields each item' do
      expected = %w[foo bar baz]
      expected.reverse_each { |item| subject.push(item) }

      _(subject.each).must_be_kind_of(Enumerator)

      actual = []
      subject.each { |item| actual << item }
      _(actual).must_equal(expected)
    end
  end
end
