require 'standard_item'
class Pass < StandardItem

  def update_item

  end

  # def update_backstage_pass(item)
  #   if is_backstage_pass?(item) && item.quality < 50
  #     if item.sell_in > 9
  #       increment_quality(item)
  #     elsif item.sell_in > 4
  #       2.times { increment_quality(item) }
  #     elsif item.sell_in > 0
  #       3.times { increment_quality(item) }
  #     else
  #       item.quality = 0
  #     end
  #     decrement_sellin(item)
  #   end
  # end


end
