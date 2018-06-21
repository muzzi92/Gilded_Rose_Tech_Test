class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|

      if !is_aged_brie?(item) && !is_backstage_pass?(item)
        if item.quality > 0
          decrement_quality(item) if !is_sulfuras?(item)
        end
      else
        if item.quality < 50
          increment_quality(item)
          if is_backstage_pass?(item)
            if item.sell_in < 11
              increment_quality(item) if item.quality < 50
            end
            if item.sell_in < 6
              increment_quality(item) if item.quality < 50
            end
          end
        end
      end

      # Sulfuras should not deprecate
      item.sell_in -= 1 unless is_sulfuras?(item)


      if item.sell_in < 0
        if !is_aged_brie?(item)
          if !is_backstage_pass?(item)

            if item.quality > 0
              decrement_quality(item) if !is_sulfuras?(item)
            end

          else # item.name != "Backstage passes to a TAFKAL80ETC concert"
            item.quality = item.quality - item.quality
          end # item.name != "Backstage passes to a TAFKAL80ETC concert"

        else #item.name != "Aged Brie"
          increment_quality(item) if item.quality < 50
        end #item.name != "Aged Brie"

      end #item.sell_in < 0


    end

  end

  private

  def increment_quality(item)
    item.quality += 1
  end

  def decrement_quality(item)
    item.quality -= 1
  end

  def is_standard_item?(item)
    !is_aged_brie?(item) || !is_backstage_pass?(item) || !is_sulfuras?(item)
  end

  def is_sulfuras?(item)
    item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def is_backstage_pass?(item)
    item.name == 'Backstage passes to a TAFKAL80ETC concert'
  end

  def is_aged_brie?(item)
    item.name == 'Aged Brie'
  end

  def handle_standard_item(item)
    if is_standard_item(item)
      decrement_quality(item)
      item.sell_in -= 1
    end
  end


end





class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
