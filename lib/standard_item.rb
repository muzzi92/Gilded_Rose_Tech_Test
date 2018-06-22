require 'item'
class StandardItem < Item
  def initialize(name, sell_in, quality)
    super
  end

  def decrease_sell_in
    @sell_in -= 1
  end

  def decrease_quality
    @quality -= 1
  end

end
