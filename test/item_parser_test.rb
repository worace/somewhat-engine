require_relative './test_helper'

class ItemParserTest < Minitest::Test 

  def test_it_can_read_from_CSV_file
    item_parser = ItemParser.new("./data")
    result = item_parser.items.class
    assert_equal CSV, result
  end

  def test_it_responds_to_items
    item_parser = ItemParser.new("./data")
    assert item_parser.respond_to?(:items)
  end

end