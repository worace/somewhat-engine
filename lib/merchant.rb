class Merchant

  attr_accessor :repository,
                :id,
                :name,
                :created_at,
                :updated_at

  def initialize(repository, data)
    @repository = repository
    @id         = data[:id].to_i
    @name       = data[:name]
    @created_at = Date.parse(data[:created_at])
    @updated_at = Date.parse(data[:updated_at])
  end

  def items
    @items_results ||= item_repo.find_all_by_merchant_id(id)
  end

  def invoice_items
    @items_result ||= invoice_item_repo.invoice_items.select do |invoice_item|
      items.any? { |item| item.id == invoice_item.item_id }
    end
  end

  def invoices
    @invoices_results ||= invoice_repo.find_all_by_merchant_id(id)
  end


  def revenue(date = nil)
    sum = BigDecimal.new(0)
    successful_invoice_items
    date == nil ? revenue_no_date(sum) : revenue_with_date(sum, date)
  end

  def revenue_no_date(sum)
    sum_revenue(sum, successful_invoice_items)
  end

  def revenue_with_date(sum, date)
    success_invoices = invoice_items_with_successful_transactions_by_date(date)
    invoice_items_for_date = successful_invoice_items.select do |invoice_item|
      find_invoices_for_date(success_invoices, invoice_item)
    end
    sum_revenue(sum, invoice_items_for_date)
  end

  def sum_revenue(sum,invoice_items)
    invoice_items.each do |item|
      sum += (item.quantity * BigDecimal.new(item.unit_price))
    end
    sum
  end

  def favorite_customer
    favorite_customer = successful_invoices.map do |invoice|
      count_customer_invoices(invoice)
    end
    customer_repo.find_by_id(favorite_customer.uniq.max[1])
  end

  def customers_with_pending_invoices
    pending_invoices = invoices.reject do |invoice|
      successful_invoices.any? { |success| success.id == invoice.id }
    end
    find_customers_with_pending_invoices(pending_invoices)
  end

  def sum_items
    successful_invoice_items.reduce(0) do |sum,invoice_item|
      sum += invoice_item.quantity
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

  def item_repo
    sales_engine.item_repository
  end

  def customer_repo
    sales_engine.customer_repository
  end

  def find_invoices_for_date(success_invoices, invoice_item)
    success_invoices.any? do |success_invoice|
      success_invoice.id == invoice_item.invoice_id
    end
  end

  def find_customers_with_pending_invoices(pending_invoices)
    pending_invoices.map! do |invoice|
      customer_repo.find_by_id(invoice.customer_id)
    end
  end

  def count_customer_invoices(invoice)
    count = successful_invoices.count do |success_invoice|
      success_invoice.customer_id == invoice.customer_id
    end
    [count, invoice.customer_id]
  end

  def unsuccessful_invoices
    invoice_items
    invoices
    transactions
    unsuccessful_transactions
    invoices_with_unsuccessful_transactions
  end

  def unsuccessful_invoice_items
    unsuccessful_invoices
    invoice_items_with_unsuccessful_transactions
  end

  def successful_invoices
    invoice_items
    invoices
    transactions
    successful_transactions
    invoices_with_successful_transactions
  end

  def successful_invoice_items
    successful_invoices
    invoice_items_with_successful_transactions
  end

  def transactions
    @transactions_results ||= transaction_repo.transactions.select do |entry|
      invoices.any? { |invoice| invoice.id == entry.invoice_id }
    end
  end

  def successful_transactions
    @successful_transactions_results ||= transactions.select do |entry|
      entry.result == "success"
    end
  end

  def unsuccessful_transactions
    @unsuccessful_transactions_results ||= transactions.select do |entry|
      entry.result == "failed"
    end
  end

  def invoices_with_successful_transactions
    @successful_invoices_result ||= invoices.select do |invoice|
      successful_transactions.any? do |transaction|
        transaction.invoice_id == invoice.id
      end
    end
  end

  def invoices_with_unsuccessful_transactions
    @unsuccessful_invoices_result ||= invoices.select do |invoice|
      unsuccessful_transactions.any? do |transaction|
        transaction.invoice_id == invoice.id
      end
    end
  end

  def invoice_items_with_successful_transactions
    @successful_invoice_items_result ||= invoice_items.select do |invoice_item|
      successful_invoices.any? do |invoice|
        invoice.id == invoice_item.invoice_id
      end
    end
  end

  def invoice_items_with_unsuccessful_transactions
    @unsuccess_invoice_items_result ||= invoice_items.select do |invoice_item|
      invoices_with_unsuccessful_transactions.any? do |invoice|
        invoice.id == invoice_item.invoice_id
      end
    end
  end

  def invoice_items_with_successful_transactions_by_date(date)
    @successful_invoices_date_result = successful_invoices.select do |invoice|
      invoice.created_at == date
    end
  end

end
