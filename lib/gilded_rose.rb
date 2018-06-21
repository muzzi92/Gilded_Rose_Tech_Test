class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|

      if item.name != "Aged Brie" && !is_backstage_pass?(item)
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
      if !is_sulfuras?(item)
        item.sell_in = item.sell_in - 1
      end


      if item.sell_in < 0
        if item.name != "Aged Brie"
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

  def is_normal_item?(item)
    item.name != 'Aged Brie' || item.name != 'Backstage passes to a TAFKAL80ETC concert' || item.name != 'Sulfuras, Hand of Ragnaros'
  end

  def is_sulfuras?(item)
    item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def is_backstage_pass?(item)
    item.name == 'Backstage passes to a TAFKAL80ETC concert'
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
