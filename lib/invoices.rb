class Invoice

  attr_accessor :repository,
                :id,
                :customer_id,
                :merchant_id,
                :status,
                :created_at,
                :updated_at

  def initialize(repository, data)
    @repository = repository
    @id = data[:id].to_i
    @customer_id = data[:customer_id].to_i
    @merchant_id = data[:merchant_id].to_i
    @status = data[:status]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  def transactions 
    repository.parent_engine.transactions_repository.find_all_by_invoice_id(id).transactions
  end

  def invoice_items
    get_invoice_items_for_self.invoice_items
  end

  def items
    items = get_invoice_items_for_self.invoice_items.map {|item| item.item_id}
    items.uniq
  end

  def get_invoice_items_for_self
    repository.parent_engine.invoice_items_repository.find_all_by_invoice_id(id)
  end

  def customer
    repository.parent_engine.customers_repository.find_by_id(customer_id).customers[0]
  end

  def merchant
    repository.parent_engine.merchants_repository.find_by_id(merchant_id).merchants[0]
  end

end