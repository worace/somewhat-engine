require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/merchant_parser'

class MerchantParserTest < Minitest::Test 

	def test_the_merchant_hash_starts_empty
		merchant_parser = MerchantParser.new
		result = merchant_parser.merchants
		assert_equal result, {} 
	end

	def test_it_can_read_from_CSV_file
		merchant_parser = MerchantParser.new
		merchant_parser.read_merchant_data_from_csv_file
		result = merchant_parser.merchant_data.class
		assert_equal CSV, result
	end

	def test_it_creates_a_hash_of_objects_from_CSV
		merchant_parser = MerchantParser.new
		merchant_parser.read_merchant_data_from_csv_file
		merchant_parser.create_merchant_objects
		result = merchant_parser.merchants.class
		assert_equal Hash, result
	end

	def test_it_creates_a_hash_of_merchant_objects_from_CSV
		merchant_parser = MerchantParser.new
		merchant_parser.read_merchant_data_from_csv_file
		merchant_parser.create_merchant_objects
		result = merchant_parser.merchants[merchant_parser.merchants.keys.sample].class
		assert_equal Merchant, result
	end

	def test_it_responds_to_printing_out_data
		merchant_parser = MerchantParser.new
		assert merchant_parser.respond_to?(:print_out_all_data_from_csv_file)
	end

end