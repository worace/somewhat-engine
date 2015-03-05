require './test/test_helper'

class MerchantParserTest < Minitest::Test 

	def test_it_can_read_from_CSV_file
		merchant_parser = MerchantParser.new
		merchant_parser.read_merchant_data_from_csv_file
		result = merchant_parser.merchant_data.class
		assert_equal CSV, result
	end

	def test_it_responds_to_printing_out_data
		merchant_parser = MerchantParser.new
		assert merchant_parser.respond_to?(:print_out_all_data_from_csv_file)
	end

	def test_it_prints_out_merchant_data
		merchant_parser = MerchantParser.new
		result = merchant_parser.read_merchant_data_from_csv_file.class
		assert_equal CSV,result
	end

end