require 'backstage_pass'

describe Pass do

  subject { Pass.new('Backstage pass to Take That', 15, 20) }

  describe '#initialize' do
    it 'Inherits sell_in attribute from StandardItem class' do
      expect(subject.sell_in).to eq(15)
    end
    it 'Inherits quality attribute from StandardItem class' do
      expect(subject.quality).to eq(20)
    end
    it 'Initializes with a default name attribute of Sulfuras, Hand of Ragnaros' do
      expect(subject.name).to eq('Backstage pass to Take That')
    end
  end



end
