#spec/enumerables_spec.rb
require_relative 'spec_helper.rb'
require_relative '../enumerables.rb'

RSpec.describe Enumerable do
  let(:array) {[]}
  describe "#my_each" do
    it 'checks if it returns Enumerator when no block is given' do
      expect(array.my_each).to be_a(Enumerator)
    end
    it 'checks if elements are pushed inside the empty array' do
      %w[dog door cat].my_each { |elem| array << elem}
      expect(array).to eq(%w[dog door cat])
    end
  end

  describe "#my_each_with_index" do
    it 'checks if it returns Enumerator when no block is given'do
      expect(array.my_each_with_index).to be_a(Enumerator)
    end
    it 'checks if elements are pushed inside the empty array with index' do
      %w[dog door cat].my_each_with_index { |val, index| array[index] = val}
      expect(array).to eq(%w[dog door cat])
    end
  end

  describe 'my_select' do

    it 'checks if it returns Enumerator when no block is given' do
      expect(array.my_select).to be_a(Enumerator)
    end

    it 'tests when my_select is invoked by an Array' do
      expect([1,2,3,8].my_select { |n| n.even? }).to eq([2, 8])
    end

    it 'tests when my_select is invoked by an Array of symbol' do
      expect([1,2,3,8].my_select(&:odd?)).to eq([1, 3])
    end
  end
end