require 'item'
class StandardItem < Item

  MIN_QUALITY = 0

  def initialize(name, sell_in, quality)
    super
  end

  def decrease_sell_in
    @sell_in -= 1
  end

  def decrease_quality
    @quality -= 1 unless @quality == MIN_QUALITY
  end

end
