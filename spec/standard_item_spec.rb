require 'standard_item'
describe StandardItem do
  subject { StandardItem.new('Axe', 10, 20) }
  describe '#intitialize' do
    it 'Inherits name attribute from Item parent class' do
      expect(subject.name).to eq('Axe')
    end
    it 'Inherits sell_in attribute from Item parent class' do
      expect(subject.sell_in).to eq(10)
    end
    it 'Inherits quality attribute from Item parent class' do
      expect(subject.quality).to eq(20)
    end
  end

  describe '#decrease_sell_in' do
    it 'Reduces sell_in attribute by 1' do
      subject.decrease_sell_in
      expect(subject.sell_in).to eq(9)
    end
  end

  describe '#decrease_quality' do
    it 'Reduces quality attribute by 1' do
      subject.decrease_quality
      expect(subject.quality).to eq(19)
    end
    it 'Does not reduce quality to less than MIN_QUALITY' do
      21.times { subject.decrease_quality }
      expect(subject.quality).to eq(described_class::MIN_QUALITY)
    end
  end
end
