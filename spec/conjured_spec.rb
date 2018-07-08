require 'conjured'

describe Conjured do

  subject { Conjured.new('Cake', 15, 20) }

  describe '#initialize' do
    it 'Inherits sell_in attribute from StandardItem class' do
      expect(subject.sell_in).to eq(15)
    end
    it 'Inherits quality attribute from StandardItem class' do
      expect(subject.quality).to eq(20)
    end
    it 'Initializes with name attribute from StandardItem class' do
      expect(subject.name).to eq('Cake')
    end
  end
end
