require 'item'

describe Item do

  subject { Item.new(name="Aged Brie", sell_in=2, quality=0) }

  describe '#initialize' do
    it 'Saves first parameter as name attribute' do
      expect(subject.name).to eq('Aged Brie')
    end
    it 'Saves second parameter as sell_in attribute' do
      expect(subject.sell_in).to eq(2)
    end
    it 'Saves third parameter as quality attribute' do
      expect(subject.quality).to eq(0)
    end
  end

end
