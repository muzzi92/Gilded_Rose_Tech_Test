require 'standard_item'

class Brie < StandardItem
  def initialize(name = 'Aged Brie', sell_in, quality)
    super
  end

  def increase_quality
    @quality += 1 unless @quality >= 50
  end
end
