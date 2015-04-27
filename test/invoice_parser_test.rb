require_relative './test_helper'

class InvoiceParserTest < Minitest::Test

  def test_it_can_read_from_CSV_file
    invoice_parser = InvoiceParser.new("./data")
    result = invoice_parser.invoices.class
    assert_equal CSV, result
  end

  def test_it_responds_to_invoices
    invoice_parser = InvoiceParser.new("./data")
    assert invoice_parser.respond_to?(:invoices)
  end


end