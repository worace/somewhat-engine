class Customer

  attr_accessor :repository,
                :id,
                :first_name,
                :last_name,
                :created_at,
                :updated_at

  def initialize(repository, data)
    @repository = repository
    @id = data[:id].to_i
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  def invoices
    repository.parent_engine.invoice_repository.find_all_by_customer_id(id)
  end

  def transactions
    repository.parent_engine.transaction_repository.transaction.select do |transaction|
      invoices.any? { |invoice| invoice.id == transaction.invoice_id }
    end
  end

  def favorite_merchant
    favorite_merchant = []
    invoices_with_successful_transactions.each do |invoice|
      favorite_merchant << [(invoices_with_successful_transactions.count {|inv| inv == invoice}), invoice.merchant_id]
    end
    repository.parent_engine.merchant_repository.find_by_id(favorite_merchant.max[1])
  end

  def successful_transactions
    successful_transactions = transactions.select {|transaction| transaction.result == "success"}
  end

  def invoices_with_successful_transactions
    invoices.select {|invoice| successful_transactions.any?{|transaction| transaction.invoice_id == invoice.id}}
  end

end

