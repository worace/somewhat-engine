require 'csv'
require './lib/invoices'

class InvoiceParser

  attr_accessor :invoice_data

  def read_invoice_data_from_csv_file
    @invoice_data ||= CSV.open("./data/invoices.csv",
                              headers: true,
                              header_converters: :symbol)
  end

  def print_out_all_data_from_csv_file
    @invoice_data.each {|data| puts data}
  end

end

if __FILE__ == $0
  invoice_parser = InvoiceParser.new
  invoice_parser.read_invoice_data_from_csv_file
  puts invoice_parser.invoice_data
end

