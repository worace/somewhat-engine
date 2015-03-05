require 'csv'
require './lib/merchants_repository'
require './lib/customers_repository'
require './lib/invoices_repository'
require './lib/items_repository'

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