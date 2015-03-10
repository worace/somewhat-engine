require 'bigdecimal/util'
require 'bigdecimal'
require 'date'

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
    @items_results ||= item_repository.find_all_by_merchant_id(id)
  end

  def invoice_items
    @invoice_items_result ||= invoice_item_repository.invoice_items.select do |invoice_item|
      items.any? { |item| item.id == invoice_item.item_id }
    end
  end


  def invoices
    @invoices_results ||= invoice_repository.find_all_by_merchant_id(id)
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
    result = invoice_items_with_successful_transactions_by_date(date)
    invoice_items_for_date = successful_invoice_items.select do |invoice_item| 
      result.any? { |success| success.id == invoice_item.invoice_id }
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
      [(successful_invoices.count { |success_invoice| success_invoice.customer_id == invoice.customer_id } ), invoice.customer_id]
    end
    customer_repository.find_by_id(favorite_customer.uniq.max[1])
  end

  def customers_with_pending_invoices
    pending_invoices = invoices.reject do |invoice|
      successful_invoices.any? { |success| success.id == invoice.id }
    end
    pending_invoices.map! { |invoice| customer_repository.find_by_id(invoice.customer_id) }
  end

  def sum_items
    successful_invoice_items.reduce(0) do |sum,invoice_item|
      sum += invoice_item.quantity
    end
  end


  private 

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
    @transactions_results ||= transaction_repository.transactions.select do |transaction|
      invoices.any? { |invoice| invoice.id == transaction.invoice_id }
    end
  end

  def successful_transactions
    @successful_transactions_results ||= transactions.select do |transaction| 
      transaction.result == "success"
    end
  end

  def unsuccessful_transactions
    @unsuccessful_transactions_results ||= transactions.select do |transaction| 
      transaction.result == "failed"
    end
  end

  def invoices_with_successful_transactions
    @successful_invoices_result ||= invoices.select do |invoice| 
      successful_transactions.any? { |transaction| transaction.invoice_id == invoice.id }
    end
  end

  def invoices_with_unsuccessful_transactions
    @unsuccessful_invoices_result ||= invoices.select do |invoice| 
      unsuccessful_transactions.any? { |transaction| transaction.invoice_id == invoice.id }
    end
  end

  def invoice_items_with_successful_transactions
    invoices_with_successful_transactions 
    @successful_invoice_items_result ||= invoice_items.select do |invoice_item| 
      successful_invoices.any? { |invoice| invoice.id == invoice_item.invoice_id }
    end
  end

  def invoice_items_with_unsuccessful_transactions
    @unsuccessful_invoice_items_result ||= invoice_items.select do |invoice_item| 
      invoices_with_unsuccessful_transactions.any? { |invoice| invoice.id == invoice_item.invoice_id }
    end
  end

   def invoice_items_with_successful_transactions_by_date(date)
    @successful_invoices_by_date_result = successful_invoices.select do |invoice|
      invoice.created_at == date
    end
  end


  def sales_engine
    repository.parent_engine
  end

  def invoice_repository
    sales_engine.invoice_repository
  end

  def invoice_item_repository
    sales_engine.invoice_item_repository
  end

  def merchant_repository
    sales_engine.merchant_repository
  end

  def transaction_repository
    sales_engine.transaction_repository
  end

  def item_repository
    sales_engine.item_repository
  end

  def customer_repository
    sales_engine.customer_repository
  end

end
