require 'csv'
require_relative './merchant_repository'
require_relative './customer_repository'
require_relative './invoice_repository'
require_relative './item_repository'

class SalesEngine

  attr_accessor :merchant_repository,
                :customer_repository,
                :invoice_repository,
                :item_repository

  def startup
    @merchant_repository = MerchantRepository.new(self)
    @customer_repository = CustomerRepository.new(self)
    @invoice_repository  = InvoiceRepository.new(self)
    @item_repository = ItemRepository.new(self)
  end

end

if __FILE__ == $0

  engine = SalesEngine.new
  engine.startup

end