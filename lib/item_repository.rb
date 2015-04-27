class ItemRepository

  attr_accessor :items,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @items         = data.map { |element| (Item.new(self, element)) }
  end

  def inspect
    "#<#{self.class} #{items.size} rows>"
  end

  def all
    items
  end

  def random
    items.sample
  end

  def find_by_id(id)
    items.find { |data| data.id == id }
  end

  def find_by_name(name)
    items.find { |data| data.name.downcase == name.downcase }
  end

  def find_by_description(description)
    items.find { |data| data.description.downcase == description.downcase }
  end

  def find_all_by_id(id)
    items.find_all { |data| data.id == id }
  end

end
