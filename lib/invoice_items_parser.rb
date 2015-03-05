require_relative './invoice_items'
require 'csv'

class InvoiceItemsParser

  attr_accessor :invoice_items_data

  def read_invoice_items_data_from_csv_file
    @invoice_items_data = CSV.open("../data/invoice_items.csv",
                                    headers: true,
                                    header_converters: :symbol)
  end

  def print_out_all_data_from_csv_file
    @invoice_items_data.each {|data| puts data}
  end
end

if __FILE__ == $0
  invoice_items_parser = InvoiceItemsParser.new
  invoice_items_parser.read_invoice_items_data_from_csv_file
  puts invoice_items_parser.invoice_items_data
end