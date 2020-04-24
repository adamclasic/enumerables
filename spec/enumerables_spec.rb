# spec/enumerables_spec.rb
require_relative 'spec_helper.rb'
require_relative '../enumerables.rb'

RSpec.describe Enumerable do
  let(:array) { [] }
  describe "#my_each" do
    it 'checks if it returns Enumerator when no block is given' do
      expect(array.my_each).to be_a(Enumerator)
    end
    it 'checks if elements are pushed inside the empty array' do
      %w[dog door cat].my_each { |elem| array << elem }
      expect(array).to eq(%w[dog door cat])
    end
  end

  describe "#my_each_with_index" do
    it 'checks if it returns Enumerator when no block is given' do
      expect(array.my_each_with_index).to be_a(Enumerator)
    end
    it 'checks if elements are pushed inside the empty array with index' do
      %w[dog door cat].my_each_with_index { |val, index| array[index] = val }
      expect(array).to eq(%w[dog door cat])
    end
  end

  describe 'my_select' do
    it 'checks if it returns Enumerator when no block is given' do
      expect(array.my_select).to be_a(Enumerator)
    end

    it 'tests when my_select is invoked by an Array' do
      expect([1, 2, 3, 8].my_select { |n| n.even? }).to eq([2, 8])
    end

    it 'tests when my_select is invoked by an Array of symbol' do
      expect([1, 2, 3, 8].my_select(&:odd?)).to eq([1, 3])
    end
  end

  describe '#my_all?' do
    it 'checks if it returns false for a condition' do
      expect(%w[dog door cat].my_all? { |val| val.length > 3 }).to be_falsy
    end

    it 'checks if it returns true for a condition' do
      expect(%w[dog door cat].my_all? { |val| val.length <= 3 }).to be_falsy
    end

    it 'checks if it returns false if array contain a nil' do
      expect([1, 2, 3, nil].my_all?).to be_falsy
    end

    it 'checks if it returns true if array is empty' do
      expect([].my_all?).to be_truthy
    end

    it 'checks if it returns true if array is all integers' do
      expect([1, 2, 3, 8].my_all?(Integer)).to be_truthy
    end
  end

  describe '#my_any?' do
    it 'checks if it returns false for a condition' do
      expect(%w[dog door cat].my_any? { |val| val.length > 3 }).to be_truthy
    end

    it 'checks if it returns true for a condition' do
      expect(%w[dog door cat].my_any? { |val| val.length <= 3 }).to be_truthy
    end

    it 'checks if it returns true if array contain a nil' do
      expect([1, 2, 3, nil].my_any?).to be_truthy
    end

    it 'checks if it returns false if array is empty' do
      expect([].my_any?).to be_falsy
    end

    it 'checks if it returns true if array is all integers' do
      expect([1, 2, 3, 8].my_any?(Integer)).to be_truthy
    end
  end

  describe '#my_none?' do
    it 'checks if it returns false for a condition' do
      expect(%w[dog door cat].my_none? { |val| val.length > 3 }).to be_falsy
    end

    it 'checks if it returns true for a condition' do
      expect(%w[dog door cat].my_none? { |val| val.length <= 3 }).to be_falsy
    end

    it 'checks if it returns false if array contain a nil' do
      expect([1, 2, 3, nil].my_none?).to be_falsy
    end

    it 'checks if it returns true if array is empty' do
      expect([].my_none?).to be_truthy
    end

    it 'checks if it returns false if array is all integers' do
      expect([1, 2, 3, 8].my_none?(Integer)).to be_falsy
    end

    describe '#count' do
      it 'checks if it returns the length of the array if no block is given' do
        expect([1, 2, 3, 8].count).to eq([1, 2, 3, 8].length)
      end

      it 'checks if it returns the length of the array if no block is given' do
        expect([1, 2, 3, 8].count(&:even?)).to eq(2)
      end
    end

    describe '#my_map' do
      let(:array_of_strings) { %w[dog door cat] }

      it 'checks if it returns Enumerator when no block is given' do
        expect(array.my_map).to be_a(Enumerator)
      end

      it 'checks if elements are pushed inside the empty array' do
        expect(array_of_strings.my_map(&:upcase)).to eq(%w[DOG DOOR CAT])
      end
    end

    describe '#my_inject' do
      it 'check when a Symbol is given' do
        expect([5, 1, 2].my_inject(:+)).to eql(8)
      end

      it 'check when a Block is given' do
        expect([5, 1, 2].my_inject() { |accum, elem| accum + elem }).to eql(8)
      end

      it 'check when a Block and a Symbol is given' do
        expect([5, 1, 2].my_inject(10) { |accum, elem| accum + elem }).to eql(18)
      end

      it 'check when two parameters are given' do
        expect((5..10).my_inject(1, :*)).to eq(151200)
      end
    end

    describe "#multiply_els" do
      it 'check if #multiply_els is working' do
        expect(multiply_els([1, 2, 3, 4, 5])).to eq(120)
      end
    end
  end
end
