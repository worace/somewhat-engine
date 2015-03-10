# require './lib/sales_engine_requires'
require_relative './sales_engine_requires'

class SalesEngine

  attr_accessor :filepath,
                :merchant_repository,
                :customer_repository,
                :invoice_repository,
                :item_repository,
                :invoice_item_repository,
                :transaction_repository
  
  def initialize(filepath)
    @filepath = filepath
  end

  def startup
    initialize_merchant_repository
    initialize_customer_repository
    initialize_item_repository
    initialize_invoice_repository
    initialize_invoice_item_repository
    initialize_transaction_repository
  end

  def initialize_merchant_repository
    data = MerchantParser.new("#{@filepath}/merchants.csv") 
    @merchant_repository = MerchantRepository.new(data.merchant_data, self)
  end

  def initialize_customer_repository
    data = CustomerParser.new("#{@filepath}/customers.csv")
    @customer_repository = CustomerRepository.new(data.customer_data, self)
  end

  def initialize_item_repository
    data = ItemParser.new("#{@filepath}/items.csv")
    @item_repository = ItemRepository.new(data.item_data, self)
  end

  def initialize_invoice_repository
    data = InvoiceParser.new("#{@filepath}/invoices.csv")
    @invoice_repository = InvoiceRepository.new(data.invoice_data, self)
  end

  def initialize_invoice_item_repository
    data = InvoiceItemParser.new("#{@filepath}/invoice_items.csv")
    @invoice_item_repository = InvoiceItemRepository.new(data.invoice_item_data, self)
  end

  def initialize_transaction_repository
    data = TransactionParser.new("#{@filepath}/transactions.csv")
    @transaction_repository = TransactionRepository.new(data.transaction_data, self)
  end

end

if __FILE__ == $0
  engine = SalesEngine.new("./data")
  engine.startup
  customer = engine.customer_repository.find_by_id(7)
  merchant = engine.merchant_repository.find_by_id(22)
  item1 = engine.item_repository.random
  item2 = engine.item_repository.random
  item3 = item1
  items = [item1, item2, item3]
  print items
  #puts items.class
end
    
 