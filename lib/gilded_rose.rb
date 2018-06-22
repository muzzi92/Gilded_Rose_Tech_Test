class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|

      update_standard_item(item)
      update_brie(item)
      update_backstage_pass(item)

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
    !is_aged_brie?(item) && !is_backstage_pass?(item) && !is_sulfuras?(item)
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

  def decrement_sellin(item)
    item.sell_in -= 1
  end

  def update_standard_item(item)
    if is_standard_item?(item) && item.quality > 0
      decrement_sellin(item)
      item.sell_in > -1 ? decrement_quality(item) : 2.times {decrement_quality(item)}
    end
  end

  def update_brie(item)
    if is_aged_brie?(item) && item.quality < 50
      increment_quality(item)
      decrement_sellin(item)
    end
  end

  def update_backstage_pass(item)
    if is_backstage_pass?(item) && item.quality < 50
      if item.sell_in > 9
        increment_quality(item)
      elsif item.sell_in > 4
        2.times { increment_quality(item) }
      elsif item.sell_in > 0
        3.times { increment_quality(item) }
      else
        item.quality = 0
      end
      decrement_sellin(item)
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
