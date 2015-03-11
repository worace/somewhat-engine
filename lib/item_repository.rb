class ItemRepository

  attr_accessor :items,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @items         = data.map { |element| (Item.new(self, element)) }
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
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

  def find_by_unit_price(price)
    price = price.to_d
    items.find { |data| data.unit_price == price }
  end

  def find_by_merchant_id(id)
    items.find { |data| data.merchant_id == id }
  end

  def find_by_created_at(date)
    items.find { |data| data.created_at.downcase == date.downcase }
  end

  def find_by_updated_at(date)
    items.find { |data| data.updated_at.downcase == date.downcase }
  end

  def find_all_by_id(id)
    items.find_all { |data| data.id == id }
  end

  def find_all_by_name(name)
    items.find_all { |data| data.name.downcase == name.downcase }
  end

  def find_all_by_description(description)
    items.find_all { |data| data.description.downcase == description.downcase }
  end

  def find_all_by_unit_price(price)
    items.find_all { |data| data.unit_price == price }
  end

  def find_all_by_merchant_id(id)
    items.find_all { |data| data.merchant_id == id }
  end

  def find_all_by_created_at(date)
    items.find_all { |data| data.created_at.downcase == date.downcase }
  end

  def find_all_by_updated_at(date)
    items.find_all { |data| data.updated_at.downcase == date.downcase }
  end

  def most_items(top_x)
    number_sold = find_number_sold
    sorted_items = sort_totals(number_sold)
    sorted_items[0..(top_x-1)].map { |item| item[1] }
  end

  def most_revenue(top_x)
    items_revenue = find_item_revenue
    sorted_revenue = sort_totals(items_revenue)
    sorted_revenue[0..(top_x-1)].map { |item| item[1] }
  end

  private

  def find_number_sold
    @items_sold ||= items.map { |item| [item.items_sold, item] }
  end

  def find_item_revenue
    @items_revenue ||= items.map { |item| [item.items_revenue, item] }
  end

  def sort_totals(totals)
    totals.sort do |item_1,item_2|
      item_2.first <=> item_1.first
    end
  end

end
