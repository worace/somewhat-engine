require_relative './customer_parser'
require_relative './customer'

class CustomerRepository

  attr_accessor :customers,
                :parent_engine,
                :data_storage

  def initialize(sales_engine = nil)
    @parent_engine = sales_engine
    @customers = []
    @customer_parser = CustomerParser.new
    @customer_parser.read_customer_data_from_csv_file
    create_customer_objects
  end

  def create_customer_objects
    @customer_parser.customer_data.each do |data|
      @customers << Customer.new(self,data)
    end
  end

  def all
    customers
  end

  def random
    customers.sample
  end

  def find_by_id(match)
    customers.find do |data|
      data.id == match
    end
  end

  def find_by_first_name(match)
    customers.find do |data|
      data.first_name.downcase == match.downcase
    end
  end

  def find_by_last_name(match)
    customers.find do |data|
      data.last_name.downcase == match.downcase
    end
  end

  def find_by_created_at(match)
    customers.find do |data|
      data.created_at.downcase == match.downcase
    end
  end

  def find_by_updated_at(match)
    customers.find do |data|
      data.updated_at.downcase == match.downcase
    end
  end

  def find_all_by_id(match)
    @data_storage = customers.find_all do |data|
      data.id == match
    end
  end

  def find_all_by_first_name(match)
    @data_storage = customers.find_all do |data|
      data.first_name.downcase == match.downcase
    end
  end

  def find_all_by_last_name(match)
    @data_storage = customers.find_all do |data|
      data.last_name.downcase == match.downcase
    end
  end

  def find_all_by_created_at(match)
    @data_storage = customers.find_all do |data|
      data.created_at.downcase == match.downcase
    end
  end

  def find_all_by_updated_at(match)
    @data_storage = customers.find_all do |data|
      data.updated_at.downcase == match.downcase
    end
  end

end


if __FILE__ == $0
  customer_repository = CustomerRepository.new
  puts customer_repository.find_all_by_first_name("abbey")
end