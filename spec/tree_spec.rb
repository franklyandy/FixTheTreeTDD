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

  defaults = { age: 0, height: 0, alive: true }
  defaults.each_pair do |attribute, expected_value|
    describe "##{attribute}" do
      it "should default to #{expected_value}" do
        expect(subject.send attribute).to be expected_value
      end
    end
  end

  describe '#age!' do
    it 'should add 1 year each time it is called' do
      expect(subject.age).to be 0
      (1..3).each do |expected_age|
        subject.age!
        expect(subject.age).to be expected_age
      end
    end
  end
end

describe FruitTree do
  it 'should be a Tree' do
    expect(subject.is_a? Tree).to be true
  end

  describe '#any_fruit?' do
    before { subject.instance_variable_set("@fruits", fruits) }
    let(:result) { subject.any_fruit? }

    context 'it has fruits' do
      let(:fruits) { [{fruit: :apple}] }
      it { expect(result).to be true }
    end

    context 'is does not have any fruits' do
      let(:fruits) { [] }
      it { expect(result).to be false }
    end
  end
end

describe AppleTree do
  it { expect(subject.is_a? FruitTree).to be true }

  describe '#any_apples?' do
    before { expect(subject).to receive(:any_fruit?).and_return :called }
    let(:result) { subject.any_apples? }
    it { expect(result).to be :called }
  end
end

# describe 'Fruit' do
# end

# describe 'Apple' do
# end
