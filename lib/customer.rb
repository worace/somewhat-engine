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

  def favorite_merchant
    @invoice_count ||= successful_invoices.map do |invoice|
      count_merchant_invoices(invoice)
    end
    merchant_repo.find_by_id(@invoice_count.max[1])
  end

  def invoices
    @invoices ||= invoice_repo.find_all_by_customer_id(id)
  end

  def transactions
    @transactions ||= transaction_repo.transactions.select do |entry|
      find_any_invoices(entry)
    end
  end

  def revenue
    sum = BigDecimal.new(0)
    successful_invoices
    sum_revenue(sum, successful_invoice_items)
  end

  def sum_items
    successful_invoice_items.reduce(0) do |sum, invoice_item|
      sum += invoice_item.quantity
    end
  end

  def pending_invoices
    pending_invoices = invoices.select do |invoice|
      invoice.transactions.any? { |transaction| transaction.result == 'failed' }
    end
  end

  def days_since_activity
    last_date = transactions.map { |entry| entry.created_at }.uniq.sort
    today = Date.today
    (today.mjd - last_date[0].mjd)+1
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
    @invoice_items_result ||= invoice_item_repo.invoice_items.select do |ii|
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
