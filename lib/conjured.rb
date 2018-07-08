require_relative 'standard_item'

class Conjured < StandardItem

  def update_item
    super
    @quality -= 1
  end

end
