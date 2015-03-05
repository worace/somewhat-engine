require './test/test_helper'

class ItemParserTest < Minitest::Test 

  def test_it_can_read_from_CSV_file
    item_parser = ItemParser.new
    item_parser.read_item_data_from_csv_file
    result = item_parser.item_data.class
    assert_equal CSV, result
  end

  def test_it_responds_to_printing_out_data
    item_parser = ItemParser.new
    assert item_parser.respond_to?(:print_out_all_data_from_csv_file)
  end

end