require_relative './item'
require 'bigdecimal/util'
require 'bigdecimal'

class ItemRepository

  attr_accessor :items,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @items = data.map { |element| (Item.new(self,element)) }
  end

  def all
    items
  end

  def random
    items.sample
  end

  def find_by_id(match)
    items.find { |data| data.id == match }
  end

  def find_by_name(match)
    items.find { |data| data.name.downcase == match.downcase }
  end

  def find_by_description(match)
    items.find { |data| data.description.downcase == match.downcase }
  end

  def find_by_unit_price(match)
    price = match.to_d
    items.find { |data| data.unit_price == price }
  end

  def find_by_merchant_id(match)
    items.find { |data| data.merchant_id == match }
  end

  def find_by_created_at(match)
    items.find { |data| data.created_at.downcase == match.downcase }
  end

  def find_by_updated_at(match)
    items.find { |data| data.updated_at.downcase == match.downcase }
  end

  def find_all_by_id(match)
    items.find_all { |data| data.id == match }
  end

  def find_all_by_name(match)
    items.find_all { |data| data.name.downcase == match.downcase }
  end

  def find_all_by_description(match)
    items.find_all { |data| data.description.downcase == match.downcase }
  end

  def find_all_by_unit_price(match)
    items.find_all { |data| data.unit_price == match }
  end

  def find_all_by_merchant_id(match)
    items.find_all { |data| data.merchant_id == match }
  end

  def find_all_by_created_at(match)
    items.find_all { |data| data.created_at.downcase == match.downcase }
  end

  def find_all_by_updated_at(match)
    items.find_all { |data| data.updated_at.downcase == match.downcase }
  end

  def most_items(x)
    find_total_numbers_of_all_items_sold
    sorted_items_by_total = @items_sold.sort { |item1,item2| item2.first <=> item1.first }
    sorted_items_by_total[0..(x-1)].map { |element| element[1] }
  end

  def find_total_numbers_of_all_items_sold
    @items_sold ||= items.map {|tally| [tally.items_sold, tally]}
  end

  def most_revenue(x)
    find_total_revenue_of_all_items_sold
    sorted_items_by_total = @items_revenue.sort { |item1,item2| item2.first <=> item1.first }
    sorted_items_by_total[0..(x-1)].map { |element| element[1] }
  end

  def find_total_revenue_of_all_items_sold
    @items_revenue ||= items.map { |tally| [tally.items_revenue, tally] }
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

end
