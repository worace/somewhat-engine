require_relative './invoice'
require 'csv'

class InvoiceParser

  attr_accessor :invoice_data

  def initialize(file_path)
    @invoice_data = CSV.open(file_path,
                             headers: true,
                             header_converters: :symbol
                            )
  end
end
