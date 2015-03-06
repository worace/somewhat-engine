require './lib/customers'

class CustomerRepository

  attr_accessor :customers,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @customers = data.map do |element|
      (element.kind_of? Customer) ? element : (Customer.new(self,element))
    end
  end

  def all
    CustomerRepository.new(
      customers,
      parent_engine
    ).customers
  end

  def random
    CustomerRepository.new(
      [customers.sample],
      parent_engine
    ).customers
  end

  def find_by_id(match)
    CustomerRepository.new(
      [customers.find {|data| data.id == match}],
      parent_engine
    ).customers
  end

  def find_by_first_name(match)
    CustomerRepository.new(
      [customers.find {|data| data.first_name.downcase == match.downcase}],
      parent_engine
    ).customers
  end

  def find_by_last_name(match)
    CustomerRepository.new(
      [customers.find {|data| data.last_name.downcase == match.downcase}],
      parent_engine
    ).customers
  end

  def find_by_created_at(match)
    CustomerRepository.new(
      [customers.find {|data| data.created_at.downcase == match.downcase}],
      parent_engine
    ).customers
  end

  def find_by_updated_at(match)
    CustomerRepository.new(
      [customers.find {|data| data.updated_at.downcase == match.downcase}],
      parent_engine
    ).customers
  end

  def find_all_by_id(match)
    CustomerRepository.new(
      customers.find_all {|data| data.id == match},
      parent_engine
    ).customers
  end

  def find_all_by_first_name(match)
    CustomerRepository.new(
      customers.find_all {|data| data.first_name.downcase == match.downcase},
      parent_engine
    ).customers
  end

  def find_all_by_last_name(match)
    CustomerRepository.new(
      customers.find_all {|data| data.last_name.downcase == match.downcase},
      parent_engine
    ).customers
  end

  def find_all_by_created_at(match)
    CustomerRepository.new(
      customers.find_all {|data| data.created_at.downcase == match.downcase},
      parent_engine
    ).customers
  end

  def find_all_by_updated_at(match)
    CustomerRepository.new(
      customers.find_all {|data| data.updated_at.downcase == match.downcase},
      parent_engine
    ).customers
  end

end