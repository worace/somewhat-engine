class Customer

  attr_accessor :repository,
                :id,
                :first_name,
                :last_name,
                :created_at,
                :updated_at

  def initialize(repository, data)
    @repository = repository
    @id         = data[:id].to_i
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
    @created_at = Date.parse(data[:created_at])
    @updated_at = Date.parse(data[:updated_at])
  end

  def invoices
    invoice_repo.find_all_by_customer_id(id)
  end

  def transactions
    transaction_repo.transactions.select do |entry|
      find_any_invoices(entry)
    end
  end

  private

  def sales_engine
    repository.parent_engine
  end

  def invoice_repo
    sales_engine.invoice_repository
  end

  def invoice_item_repo
    sales_engine.invoice_item_repository
  end

  def merchant_repo
    sales_engine.merchant_repository
  end

  def transaction_repo
    sales_engine.transaction_repository
  end

  def invoice_items
    invoice_item_repo.invoice_items.select do |ii|
      invoices.any? { |invoice| invoice.id == ii.invoice_id }
    end
  end

  def successful_invoice_items
    @successful_invoice_items_result ||= invoice_items.select do |invoice_item|
      successful_invoices.any? do |invoice|
        invoice.id == invoice_item.invoice_id
      end
    end
  end

  def find_any_invoices(transaction)
    invoices.any? { |invoice| invoice.id == transaction.invoice_id }
  end

  def successful_transactions
    @successful_transactions = transactions.select do |entry|
      entry.result == "success"
    end
  end

  def successful_invoices
    @successful_invoices = invoices.select do |invoice|
      find_any_successful_transactions(invoice)
    end
  end

  def find_any_successful_transactions(invoice)
    successful_transactions.any? do |transaction|
      transaction.invoice_id == invoice.id
    end
  end

  def count_merchant_invoices(invoice)
    count = successful_invoices.count do |successful_invoice|
      successful_invoice == invoice
    end
    [count, invoice.merchant_id]
  end

  def sum_revenue(sum, invoice_items)
    invoice_items.each do |item|
      sum += (item.quantity * BigDecimal.new(item.unit_price))
    end
    sum
  end

end
