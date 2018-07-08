require_relative 'item'
require_relative 'standard_item'
require_relative 'sulfuras'
require_relative 'brie'
require_relative 'backstage_pass'
require_relative 'conjured'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.update_item
    end
  end

end
