require 'brie'

describe Brie do

  subject { Brie.new(2, 5) }

  describe '#initialize' do
    it 'It inherits sell_in attribute from StandardItem parent class' do
      expect(subject.sell_in).to eq(2)
    end
    it 'It inherits quality attribute from StandardItem parent class' do
      expect(subject.quality).to eq(5)
    end
    it 'It has default name attribute of Aged Brie' do
      expect(subject.name).to eq('Aged Brie')
    end
  end

end
