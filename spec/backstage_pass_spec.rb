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
    it 'Initializes with name attribute from StandardItem class' do
      expect(subject.name).to eq('Backstage pass to Take That')
    end
  end

  describe '#update_item' do
    it 'Decreases sell_in by 1' do
      subject.update_item
      expect(subject.sell_in).to eq(14)
    end
    it 'Increase quality by 1 when sell_in is over 10' do
      subject.update_item
      expect(subject.quality).to eq(21)
    end
    it 'Increase quality by 2 when sell_in is over 5' do
      pass = Pass.new('Test', 7, 20)
      pass.update_item
      expect(pass.quality).to eq(22)
    end
    it 'Increase quality by 3 when sell_in is over 0' do
      pass = Pass.new('Test', 3, 20)
      pass.update_item
      expect(pass.quality).to eq(23)
    end
    it 'Has a quality of 0 when sell_in is negative' do
      pass = Pass.new('Test', 0, 20)
      pass.update_item
      expect(pass.quality).to eq(0)
    end
    it 'Never pushes quality above 50' do
      pass = Pass.new('Test', 5, 50)
      pass.update_item
      expect(pass.quality).to eq(50)
    end
  end

end
