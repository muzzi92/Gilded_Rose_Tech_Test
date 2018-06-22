require 'gilded_rose'

describe GildedRose do
  let(:standard_item) { double :item, name: 'Elixir of the Mongoose' }
  subject { GildedRose.new([standard_item]) }

  describe '#update_quality' do
    it 'Calls update_standard_item' do
      expect(subject).to receive(:update_standard_item).with(standard_item)
      subject.update_quality
    end
  end

end
