require_relative 'standard_item'

class Brie < StandardItem
  def initialize(name = 'Aged Brie', sell_in, quality)
    super
  end

  def update_item
    increase_quality
    decrease_sell_in
  end

  protected

  def increase_quality
    @quality += 1 if is_quality_in_range
  end

end
