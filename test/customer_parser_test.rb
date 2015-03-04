require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/customer_parser'

class CustomerParserTest < Minitest::Test 

	def test_it_can_read_from_CSV_file
		customer_parser = CustomerParser.new
		customer_parser.read_customer_data_from_csv_file
		result = customer_parser.customer_data.class
		assert_equal CSV, result
	end

	def test_it_responds_to_printing_out_data
		customer_parser = CustomerParser.new
		assert customer_parser.respond_to?(:print_out_all_data_from_csv_file)
	end

end