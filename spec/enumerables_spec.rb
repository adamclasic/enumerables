#spec/enumerables_spec.rb
require_relative 'spec_helper.rb'
require_relative '../enumerables.rb'
puts (1..5).my_each { |elem| print "#{elem + 1} "} # => 2 3 4 5 6

RSpec.describe Enumerable do
  describe "#my_each" do
    let(:array) {[]}
    it 'checks if it returns true for enumerator' do
      expect(:array.my_each.class).to ql(Enumerator)
    end
    it 'checks if elements are pushed inside the empty array' do
      %w[dog door cat].my_each { |elem| :array << elem}
      expect(:array).to ql(%w[dog door cat])
    end
  end
end