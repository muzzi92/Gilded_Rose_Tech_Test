require 'gilded_rose'

describe GildedRose do
  let(:item) { double :standarditem }
  subject { GildedRose.new([item]) }

  describe '#update_quality' do
    it 'Calls update_standard_item' do
      expect(item).to receive(:update_item)
      subject.update_quality
    end
  end

end
