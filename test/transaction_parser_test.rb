require_relative './test_helper'

class TransactionParserTest < Minitest::Test 

  def test_it_can_read_from_CSV_file
    transaction_parser = TransactionParser.new("./data")
    result = transaction_parser.transactions.class
    assert_equal CSV, result
  end

  def test_it_responds_to_transactions
    transaction_parser = TransactionParser.new("./data")
    assert transaction_parser.respond_to?(:transactions)
  end

end