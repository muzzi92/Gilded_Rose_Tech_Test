require 'standard_item'
describe StandardItem do
  subject { StandardItem.new('Axe', 10, 20) }
  describe '#intitialize' do
    it 'Inherits name attribute from Item parent class' do
      expect(subject.name).to eq('Axe')
    end
  end
end
