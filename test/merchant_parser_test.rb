require_relative './test_helper'

class MerchantParserTest < Minitest::Test 

  def test_it_can_read_from_CSV_file
    merchant_parser = MerchantParser.new("./data")
    result = merchant_parser.merchants.class
    assert_equal CSV, result
  end

  def test_it_responds_to_merchants
    merchant_parser = MerchantParser.new("./data")
    assert merchant_parser.respond_to?(:merchants)
  end

end