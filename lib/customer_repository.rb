# require './lib/customer'
require_relative './customer'

class CustomerRepository

  attr_accessor :customers,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @customers = data.map {|element| (Customer.new(self,element))}
  end

  def all
      customers
  end

  def random
      customers.sample
  end

  def find_by_id(match)
      customers.find {|data| data.id == match}
  end

  def find_by_first_name(match)
      customers.find {|data| data.first_name.downcase == match.downcase}
  end

  def find_by_last_name(match)
      customers.find {|data| data.last_name.downcase == match.downcase}
  end

  def find_by_created_at(match)
      customers.find {|data| data.created_at.downcase == match.downcase}
  end

  def find_by_updated_at(match)
      customers.find {|data| data.updated_at.downcase == match.downcase}
  end

  def find_all_by_id(match)
      customers.find_all {|data| data.id == match}
  end

  def find_all_by_first_name(match)
      customers.find_all {|data| data.first_name.downcase == match.downcase}
  end

  def find_all_by_last_name(match)
      customers.find_all {|data| data.last_name.downcase == match.downcase}
  end

  def find_all_by_created_at(match)
      customers.find_all {|data| data.created_at.downcase == match.downcase}
  end

  def find_all_by_updated_at(match)
      customers.find_all {|data| data.updated_at.downcase == match.downcase}
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

end