require 'gilded_rose'

describe GildedRose do
  let(:item) { spy :item }
  subject { GildedRose.new([item]) }

  describe '#update_quality' do
    it 'Calls update_standard_item' do
      expect(subject).to receive(:update_standard_item).with(item)
      subject.update_quality
    end
    it ' Calls update_brie' do
      expect(subject).to receive(:update_brie).with(item)
      subject.update_quality
    end
  end

end
