require 'bigdecimal'
require 'bigdecimal/util'

# require './lib/merchant'
require_relative './merchant'

class MerchantRepository

  attr_accessor :merchant,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @merchant = data.map {|element| (Merchant.new(self,element))}
  end

  def all
      merchant
  end

  def random
      merchant.sample
  end

  def find_by_id(match)
      merchant.find {|data| data.id == match}
  end

  def find_by_name(match)
      merchant.find {|data| data.name.downcase == match.downcase}
  end

  def find_by_created_at(match)
      merchant.find {|data| data.created_at.downcase == match.downcase}
  end

  def find_by_updated_at(match)    
      merchant.find {|data| data.updated_at.downcase == match.downcase}
  end

  def find_all_by_id(match)
      merchant.find_all {|data| data.id == match}
  end

  def find_all_by_name(match)
      merchant.find_all {|data| data.name.downcase == match.downcase}
  end

  def find_all_by_created_at(match)
      merchant.find_all {|data| data.created_at.downcase == match.downcase}
  end

  def find_all_by_updated_at(match)
      merchant.find_all {|data| data.updated_at.downcase == match.downcase}
  end

  def revenue(date)
    sum = BigDecimal.new(0)
    @merchant.each do |merchant|
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
    @most_revenue ||= @merchant.map do |merchant|
      [merchant.revenue, merchant]
    end
  end

  def most_items(x)
    find_total_items
    sorted_most_items = @most_items.sort {|item1,item2| item2.first <=> item1.first}
    sorted_most_items[0..(x-1)].map {|element| element[1]}
  end

  def find_total_items
    @most_items ||= @merchant.map do |merchant|
      [merchant.sum_items, merchant]
    end
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

end

if __FILE__ == $0
  merchant_repository = MerchantRepository.new
  puts merchant_repository.find_all_by_name("Williamson Group")
end

