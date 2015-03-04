require_relative './customer_parser'
require_relative './customer'

class CustomerRepository

  attr_accessor :customers,
                :parent_engine

  def initialize(sales_engine = nil)
    @parent_engine = sales_engine
    @customers = []
    @customer_parser = CustomerParser.new
    @customer_parser.read_customer_data_from_csv_file
  end

  def create_customer_objects
    @customer_parser.customer_data.each do |data|
      @customers << Customer.new(self,data)
   end
 end

end


if __FILE__ == $0
  customer_repository = CustomerRepository.new
  customer_repository.create_customer_objects
  puts customer_repository.customers
end