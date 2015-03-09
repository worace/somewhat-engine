require 'bigdecimal'
require 'bigdecimal/util'

# require './lib/item'
require_relative './item'

class ItemRepository

  attr_accessor :item,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @item = data.map {|element| (Item.new(self,element))}
  end

  def all
      item
  end

  def random
      item.sample
  end

  def find_by_id(match)
      item.find {|data| data.id == match}
  end

  def find_by_name(match)
      item.find {|data| data.name.downcase == match.downcase}
  end

  def find_by_description(match)
      item.find {|data| data.description.downcase == match.downcase}
  end

  def find_by_unit_price(match)
      price = match.to_d
      item.find {|data| data.unit_price == price}
  end

  def find_by_merchant_id(match)
      item.find {|data| data.merchant_id == match}
  end

  def find_by_created_at(match)
      item.find {|data| data.created_at.downcase == match.downcase}
  end

  def find_by_updated_at(match)
      item.find {|data| data.updated_at.downcase == match.downcase}
  end

  def find_all_by_id(match)
      item.find_all {|data| data.id == match}
  end

  def find_all_by_name(match)
      item.find_all {|data| data.name.downcase == match.downcase}
  end

  def find_all_by_description(match)
      item.find_all {|data| data.description.downcase == match.downcase}
  end

  def find_all_by_unit_price(match)
      item.find_all {|data| data.unit_price == match}
  end

  def find_all_by_merchant_id(match)
      item.find_all {|data| data.merchant_id == match}
  end

  def find_all_by_created_at(match)
      item.find_all {|data| data.created_at.downcase == match.downcase}
  end

  def find_all_by_updated_at(match)
      item.find_all {|data| data.updated_at.downcase == match.downcase}
  end

  def most_items(x)
    find_total_numbers_of_all_items_sold
    sorted_items_by_total = @items_sold.sort {|item1,item2| item2.first <=> item1.first}
    sorted_items_by_total[0..(x-1)].map {|element| element[1]}
  end

  def find_total_numbers_of_all_items_sold
      @items_sold ||= item.map {|tally| [tally.items_sold, tally]}
  end

  def most_revenue(x)
    find_total_revenue_of_all_items_sold
    sorted_items_by_total = @items_revenue.sort {|item1,item2| item2.first <=> item1.first}
    sorted_items_by_total[0..(x-1)].map {|element| element[1]}
  end

  def find_total_revenue_of_all_items_sold
      @items_revenue ||= item.map {|tally| [tally.items_revenue, tally]}
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

end

if __FILE__ == $0
  item_repository = ItemRepository.new
  puts item_repository.find_all_by_updated_at("2012-03-27 14:53:59 UTC").size
end