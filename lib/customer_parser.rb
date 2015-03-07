require 'csv'
#require './lib/customers'
require_relative './customer'

class CustomerParser

  attr_accessor :customer_data

  def initialize(file_path)
    @customer_data = CSV.open(file_path,
                              headers: true,
                              header_converters: :symbol)
  end
end

# if __FILE__ == $0
#   customer_parser = CustomerParser.new
#   customer_parser.read_customer_data_from_csv_file
#   puts customer_parser.customer_data
# end