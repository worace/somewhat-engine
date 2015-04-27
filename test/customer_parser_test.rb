require_relative './test_helper'

class CustomerParserTest < Minitest::Test

  def test_it_can_read_from_CSV_file
    customer_parser = CustomerParser.new("./data")
    result = customer_parser.customers.class
    assert_equal CSV, result
  end

  def test_it_responds_to_customers
    customer_parser = CustomerParser.new("./data")
    assert customer_parser.respond_to?(:customers)
  end

end