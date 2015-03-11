class InvoiceItemParser

  attr_accessor :invoice_items

  def initialize(file_path)
    @invoice_items = CSV.open(file_path,
                                  headers: true,
                                  header_converters: :symbol
                                  )
  end

end
