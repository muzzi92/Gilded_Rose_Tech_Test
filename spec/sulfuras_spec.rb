require 'sulfuras'

describe Sulfuras do

  subject { Sulfuras.new(10, 20) }

  describe '#initialize' do
    it 'Inherits sell_in attribute from StandardItem class' do
      expect(subject.sell_in).to eq(10)
    end
    it 'Inherits quality attribute from StandardItem class' do
      expect(subject.quality).to eq(20)
    end
    it 'Initializes with a default name attribute of Sulfuras, Hand of Ragnaros' do
      expect(subject.name).to eq('Sulfuras, Hand of Ragnaros')
    end
  end

  describe '#update_item' do
    it 'Has no affect on sell_in' do
      subject.update_item
      expect(subject.sell_in).to eq(10)
    end
    it 'Has no affect on quality' do
      subject.update_item
      expect(subject.quality).to eq(20)
    end
  end


end
