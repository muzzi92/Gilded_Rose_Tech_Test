require 'gilded_rose'

describe GildedRose do

  describe '#update_quality' do

    context 'When it is a standard item' do

      standard_item = Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20)
      shop = GildedRose.new([standard_item])
      shop.update_quality

      it 'Decreases the sell_in by 1' do
        expect(standard_item.sell_in).to eq(9)
      end

      it 'Decreases the quality by 1' do
        expect(standard_item.quality).to eq(19)
      end

      it 'Decreases the quality by 2 when sell_in is below 0' do
        10.times { shop.update_quality }
        expect(standard_item.quality).to eq(8)
      end

    end

    context 'When the item is Aged Brie' do

      brie = Item.new(name="Aged Brie", sell_in=2, quality=0)
      shop = GildedRose.new([brie])
      shop.update_quality

      it 'Increases the quality by 1' do
        expect(brie.quality).to eq(1)
      end

      it 'Decreases the sell_in by 1' do
        expect(brie.sell_in).to eq(1)
      end

    end

    context 'When the item is Sulfuras' do

      sulfuras = Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=1, quality=80)
      shop = GildedRose.new([sulfuras])
      shop.update_quality

      it 'Does not affect sell_in' do
        expect(sulfuras.sell_in).to eq(1)
      end

      it 'Does not affect quality' do
        expect(sulfuras.quality).to eq(80)
      end

    end

  end

end
