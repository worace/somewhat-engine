require_relative './test_helper'

class InvoiceItemsParserTest < Minitest::Test

  def test_it_can_read_from_CSV_file
    invoice_items_parser = InvoiceItemParser.new("./data")
    result = invoice_items_parser.invoice_items.class
    assert_equal CSV, result
  end

  def test_it_responds_to_invoice_items
    invoice_items_parser = InvoiceItemParser.new("./data")
    assert invoice_items_parser.respond_to?(:invoice_items)
  end

end