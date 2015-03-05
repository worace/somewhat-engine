require 'csv'
require_relative './merchant_repository'
require_relative './customer_repository'
require_relative './invoice_repository'

class SalesEngine

  attr_accessor :merchant_repository,
                :customer_repository,
                :invoice_repository

  def startup
    @merchant_repository = MerchantRepository.new(self)
    @customer_repository = CustomerRepository.new(self)
    @invoice_repository  = InvoiceRepository.new(self)
  end

end

if __FILE__ == $0

  engine = SalesEngine.new
  engine.startup

end