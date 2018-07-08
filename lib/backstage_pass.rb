require_relative 'standard_item'
class Pass < StandardItem

  def update_item
    decrease_sell_in
    increase_quality if is_quality_in_range
  end

private

def increase_quality
  @quality += 1 if is_sell_in_over_ten
  @quality += 2 if is_sell_in_6to10
  @quality += 3 if is_sell_in_1to5
  @quality = 0 if is_sell_in_negative
end

def is_sell_in_over_ten
  @sell_in > 10
end

def is_sell_in_6to10
  @sell_in > 5 && @sell_in < 11
end

def is_sell_in_1to5
  @sell_in >= 0 && @sell_in < 6
end

end
