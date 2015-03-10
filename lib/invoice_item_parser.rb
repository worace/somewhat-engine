require_relative './invoice_item'
require 'csv'

class InvoiceItemParser

  attr_accessor :invoice_item_data

  def initialize(file_path)
    @invoice_item_data = CSV.open(file_path,
                                  headers: true,
                                  header_converters: :symbol
                                  )
  end

end
