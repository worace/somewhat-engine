require './test/test_helper'

class InvoiceParserTest < Minitest::Test 

  def test_it_can_read_from_CSV_file
    invoice_parser = InvoiceParser.new
    invoice_parser.read_invoice_data_from_csv_file
    result = invoice_parser.invoice_data.class
    assert_equal CSV, result
  end

  def test_it_responds_to_printing_out_data
    invoice_parser = InvoiceParser.new
    assert invoice_parser.respond_to?(:print_out_all_data_from_csv_file)
  end

end