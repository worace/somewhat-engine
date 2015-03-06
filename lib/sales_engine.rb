require './lib/sales_engine_requires'

class SalesEngine

  attr_accessor :merchants_repository,
                :customers_repository,
                :invoices_repository,
                :items_repository,
                :invoice_items_repository,
                :transactions_repository

  def startup
    initialize_merchants_repository
    initialize_customers_repository
    initialize_items_repository
    initialize_invoices_repository
    initialize_invoice_items_repository
    initialize_transactions_repository
  end

  def initialize_merchants_repository
    data = MerchantParser.new("./data/merchants.csv") 
    @merchants_repository = MerchantRepository.new(data.merchant_data, self)
  end

  def initialize_customers_repository
    data = CustomerParser.new("./data/customers.csv")
    @customers_repository = CustomerRepository.new(data, self)
  end

  def initialize_items_repository
    data = ItemParser.new("./data/items.csv")
    @items_repository = ItemRepository.new(data, self)
  end

  def initialize_invoices_repository
    data = InvoiceParser.new("./data/invoices.csv")
    @invoices_repository = InvoiceRepository.new(data, self)
  end

  def initialize_invoice_items_repository
    data = InvoiceItemsParser.new("./data/invoice_items.csv")
    @invoice_items_repository = InvoiceItemsRepository.new(data, self)
  end

  def initialize_transactions_repository
    data = TransactionsParser.new("./data/transactions.csv")
    @transactions_repository = TransactionRepository.new(data, self)
  end

end

if __FILE__ == $0
  engine = SalesEngine.new
  engine.startup
  puts engine.merchants_repository.find_by_id(20)
  #puts engine.merchants_repository.find_all_by_name("Williamson Group")

end