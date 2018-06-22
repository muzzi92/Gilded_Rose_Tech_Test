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
end
