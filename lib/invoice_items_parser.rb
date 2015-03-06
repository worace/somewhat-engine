require 'csv'
require './lib/invoice_items'

class InvoiceItemParser

  attr_accessor :invoice_items_data

  def initialize(file_path)
    @invoice_items_data = CSV.open(file_path,
                                   headers: true,
                                   header_converters: :symbol)
  end
end