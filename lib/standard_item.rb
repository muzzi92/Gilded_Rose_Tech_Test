require 'item'
class StandardItem < Item

  MIN_QUALITY = 0
  MAX_QUALITY = 50

  def update_item
    decrease_sell_in
    decrease_quality
  end

  protected

  def decrease_sell_in
    @sell_in -= 1 if is_quality_in_range
  end

  def decrease_quality
    @quality -= 1 if is_quality_in_range
  end

  def is_quality_in_range
    @quality > MIN_QUALITY && @quality < MAX_QUALITY
  end

end
