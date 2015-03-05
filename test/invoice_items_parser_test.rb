require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/invoice_items_parser'

class InvoiceItemsParserTest < Minitest::Test 

  def test_it_can_read_from_CSV_file
    invoice_items_parser = InvoiceItemsParser.new
    invoice_items_parser.read_invoice_items_data_from_csv_file
    result = invoice_items_parser.invoice_items_data.class
    assert_equal CSV, result
  end

  def test_it_responds_to_printing_out_data
    invoice_items_parser = InvoiceItemsParser.new
    assert invoice_items_parser.respond_to?(:print_out_all_data_from_csv_file)
  end

end