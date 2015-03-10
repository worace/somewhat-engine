require_relative './merchant'
require 'bigdecimal/util'
require 'bigdecimal'

class MerchantRepository

  attr_accessor :merchants,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @merchants     = data.map { |element| (Merchant.new(self,element)) }
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

  def all
      merchants
  end

  def random
      merchants.sample
  end

  def find_by_id(id)
      merchants.find { |data| data.id == id }
  end

  def find_by_name(name)
      merchants.find { |data| data.name.downcase == name.downcase }
  end

  def find_by_created_at(date)
      merchants.find { |data| data.created_at.downcase == date.downcase }
  end

  def find_by_updated_at(date)    
      merchants.find { |data| data.updated_at.downcase == date.downcase }
  end

  def find_all_by_id(id)
      merchants.find_all { |data| data.id == id }
  end

  def find_all_by_name(name)
      merchants.find_all { |data| data.name.downcase == name.downcase }
  end

  def find_all_by_created_at(date)
      merchants.find_all { |data| data.created_at.downcase == date.downcase }
  end

  def find_all_by_updated_at(date)
      merchants.find_all { |data| data.updated_at.downcase == date.downcase }
  end

  def revenue(date)
    sum = BigDecimal.new(0)
    @merchants.each do |merchant|
      sum += merchant.revenue(date)
    end
    sum
  end

  def most_revenue(x)
    find_total_revenue
    sorted_most_revenue = @most_revenue.sort {|item1,item2| item2.first <=> item1.first}
    sorted_most_revenue[0..(x-1)].map {|element| element[1]}
  end

  def find_total_revenue
    @most_revenue ||= @merchants.map do |merchant|
      [merchant.revenue, merchant]
    end
  end

  def most_items(x)
    find_total_items
    sorted_most_items = @most_items.sort {|item1,item2| item2.first <=> item1.first}
    sorted_most_items[0..(x-1)].map {|element| element[1]}
  end

  def find_total_items
    @most_items ||= @merchants.map do |merchant|
      [merchant.sum_items, merchant]
    end
  end

end
