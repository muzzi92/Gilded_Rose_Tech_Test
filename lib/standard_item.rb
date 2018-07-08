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
    @sell_in -= 1
  end

  def decrease_quality
    if is_quality_in_range
      is_sell_in_negative ? @quality -= 2 : @quality -= 1
    end
  end

  def is_quality_in_range
    @quality > MIN_QUALITY && @quality < MAX_QUALITY
  end

  def is_sell_in_negative
    @sell_in < 0
  end

end
