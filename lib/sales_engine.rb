require './lib/sales_engine_requires'
#require_relative './sales_engine_requires'

class SalesEngine

  attr_accessor :merchant_repository,
                :customer_repository,
                :invoice_repository,
                :item_repository,
                :invoice_item_repository,
                :transaction_repository

  def startup
    initialize_merchant_repository
    initialize_customer_repository
    initialize_item_repository
    initialize_invoice_repository
    initialize_invoice_item_repository
    initialize_transaction_repository
  end

  def initialize_merchant_repository
    data = MerchantParser.new("./data/merchants.csv") 
    @merchant_repository = MerchantRepository.new(data.merchant_data, self)
  end

  def initialize_customer_repository
    data = CustomerParser.new("./data/customers.csv")
    @customer_repository = CustomerRepository.new(data.customer_data, self)
  end

  def initialize_item_repository
    data = ItemParser.new("./data/items.csv")
    @item_repository = ItemRepository.new(data.item_data, self)
  end

  def initialize_invoice_repository
    data = InvoiceParser.new("./data/invoices.csv")
    @invoice_repository = InvoiceRepository.new(data.invoice_data, self)
  end

  def initialize_invoice_item_repository
    data = InvoiceItemParser.new("./data/invoice_items.csv")
    @invoice_item_repository = InvoiceItemRepository.new(data.invoice_item_data, self)
  end

  def initialize_transaction_repository
    data = TransactionParser.new("./data/transactions.csv")
    @transaction_repository = TransactionRepository.new(data.transaction_data, self)
  end

end

if __FILE__ == $0
  engine = SalesEngine.new
  engine.startup
  puts engine.invoice_repository.find_by_id(1).invoices[0]
end

