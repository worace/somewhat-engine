require_relative './customer'
require 'csv'

class CustomerParser

  attr_accessor :customer_data

  def read_customer_data_from_csv_file
    @customer_data = CSV.open("../data/customers.csv",
      headers: true,
      header_converters: :symbol)
  end

  def print_out_all_data_from_csv_file
    @customer_data.each {|data| puts data}
  end
end

if __FILE__ == $0
  customer_parser = CustomerParser.new
  customer_parser.read_customer_data_from_csv_file
  puts customer_parser.customer_data
end