require './lib/customer'
#require_relative './customer'

class CustomerRepository

  attr_accessor :customer,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @customer = data.map do |element|
      (element.kind_of? Customer) ? element : (Customer.new(self,element))
    end
  end

  def all
    CustomerRepository.new(
      customer,
      parent_engine
    ).customer
  end

  def random
    CustomerRepository.new(
      [customer.sample],
      parent_engine
    ).customer[0]
  end

  def find_by_id(match)
    CustomerRepository.new(
      [customer.find {|data| data.id == match}],
      parent_engine
    )
  end

  def find_by_first_name(match)
    CustomerRepository.new(
      [customer.find {|data| data.first_name.downcase == match.downcase}],
      parent_engine
    ).customer
  end

  def find_by_last_name(match)
    CustomerRepository.new(
      [customer.find {|data| data.last_name.downcase == match.downcase}],
      parent_engine
    ).customer
  end

  def find_by_created_at(match)
    CustomerRepository.new(
      [customer.find {|data| data.created_at.downcase == match.downcase}],
      parent_engine
    ).customer
  end

  def find_by_updated_at(match)
    CustomerRepository.new(
      [customer.find {|data| data.updated_at.downcase == match.downcase}],
      parent_engine
    ).customer
  end

  def find_all_by_id(match)
    CustomerRepository.new(
      customer.find_all {|data| data.id == match},
      parent_engine
    ).customer
  end

  def find_all_by_first_name(match)
    CustomerRepository.new(
      customer.find_all {|data| data.first_name.downcase == match.downcase},
      parent_engine
    ).customer
  end

  def find_all_by_last_name(match)
    CustomerRepository.new(
      customer.find_all {|data| data.last_name.downcase == match.downcase},
      parent_engine
    ).customer
  end

  def find_all_by_created_at(match)
    CustomerRepository.new(
      customer.find_all {|data| data.created_at.downcase == match.downcase},
      parent_engine
    ).customer
  end

  def find_all_by_updated_at(match)
    CustomerRepository.new(
      customer.find_all {|data| data.updated_at.downcase == match.downcase},
      parent_engine
    ).customer
  end

end