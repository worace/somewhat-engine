class InvoiceParser

  attr_accessor :invoices

  def initialize(file_path)
    @invoices = CSV.open(file_path,
                             headers: true,
                             header_converters: :symbol
                             )
  end

end
