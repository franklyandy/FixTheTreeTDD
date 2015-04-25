require 'rspec'
require 'tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  read_only_attributes = %i(height age alive)
  read_only_attributes.each do |attribute|
    it "should have the read-only attribute #{attribute}" do
      expect(described_class.method_defined? attribute).to be true
      expect(described_class.method_defined? "#{attribute}=").to be false
    end
  end
end

describe 'Fruit' do
end

describe 'Apple' do
end
