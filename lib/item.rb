require 'date'

class Item

  attr_accessor :repository,
                :id,
                :name,
                :description,
                :unit_price,
                :merchant_id,
                :created_at,
                :updated_at

  def initialize(repository, data)
    @repository = repository
    @id = data[:id].to_i
    @name = data[:name]
    @description  = data[:description]
    @unit_price = data[:unit_price].scan(/\d/).join
    @merchant_id = data[:merchant_id].to_i
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  def invoice_items
    @invoice_items_result ||= repository.parent_engine.invoice_item_repository.find_all_by_item_id(id)
  end

  def merchant
    repository.parent_engine.merchant_repository.find_by_id(merchant_id)
  end

  def best_day
    invoices_with_successful_transactions
    best_day = @successful_invoices_result.map do |invoice| 
      [(@successful_invoices_result.count {|inv| Date.parse(inv.created_at) == Date.parse(invoice.created_at)}), Date.parse(invoice.created_at)]
    end
    best_day.uniq.uniq.max[1]
  end

  def invoices_with_successful_transactions
    successful_transactions
    @successful_invoices_result ||= @invoices_result.select {|invoice| @successful_transactions_result.any?{|transaction| transaction.invoice_id == invoice.id}}
  end

  def invoice_items_with_successful_transactions
    invoices_with_successful_transactions 
    @successful_invoice_items_result ||= @invoice_items_result.select {|invoice_item| @successful_invoices_result.any? {|invoice| invoice.id == invoice_item.invoice_id}}
  end

  def successful_transactions
    transactions
    @successful_transactions_result ||= @transactions_result.select {|transaction| transaction.result == "success"}
  end

  def transactions
    invoices
    @transactions_result ||= repository.parent_engine.transaction_repository.transaction.select do |transaction|
      @invoices_result.any? { |invoice| invoice.id == transaction.invoice_id }
    end
  end

  def invoices
    invoice_items 
    @invoices_result ||= repository.parent_engine.invoice_repository.invoice.select do |invoice|
      @invoice_items_result.any? {|invoice_item| invoice_item.invoice_id == invoice.id}
    end 
  end

  def items_sold
    invoice_items_with_successful_transactions
    @successful_invoice_items_result.reduce(0) {|sum,item| sum += item.quantity}
  end

   def items_revenue
    invoice_items_with_successful_transactions
    @successful_invoice_items_result.reduce(0) {|sum,item| sum += (item.quantity * item.unit_price)}
  end

end