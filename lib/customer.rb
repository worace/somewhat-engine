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
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  def favorite_merchant
    invoice_count = invoices_with_successful_transactions.map do |invoice|
      count_merchant_invoices(invoice)
    end
    merchant_repository.find_by_id(invoice_count.max[1])
  end

  def invoices
    @invoices ||= invoice_repository.find_all_by_customer_id(id)
  end

  def transactions
    @transactions ||= transaction_repository.transactions.select do |transaction|
      find_any_invoices(transaction)
    end
  end

  def successful_transactions
    @successful_transactions ||= transactions.select do |transaction|
      transaction.result == "success"
    end
  end

  def invoices_with_successful_transactions
    @invoices_with_successful_transactions ||= invoices.select do |invoice|
      find_any_successful_transactions(invoice)
    end
  end 

  private

  def sales_engine
    repository.parent_engine
  end

  def invoice_repository
    sales_engine.invoice_repository
  end

  def merchant_repository
    sales_engine.merchant_repository
  end

  def transaction_repository
    sales_engine.transaction_repository
  end

  def find_any_invoices(transaction)
    invoices.any? { |invoice| invoice.id == transaction.invoice_id }
  end

  def find_any_successful_transactions(invoice)
    successful_transactions.any? do |transaction|
      transaction.invoice_id == invoice.id
    end
  end

  def count_merchant_invoices(invoice)
    count = invoices_with_successful_transactions.count do |successful_invoice| 
      successful_invoice == invoice
    end
    [count, invoice.merchant_id]
  end

end
