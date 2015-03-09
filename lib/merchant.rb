require 'date'
require 'bigdecimal'
require 'bigdecimal/util'

class Merchant

  attr_accessor :repository,
                :id,
                :name,
                :created_at,
                :updated_at

  def initialize(repository, data)
    @repository = repository
    @id = data[:id].to_i
    @name = data[:name]
    @created_at = Date.parse(data[:created_at])
    @updated_at = Date.parse(data[:updated_at])
  end

  def items
    @items_results ||= repository.parent_engine.item_repository.find_all_by_merchant_id(id)
  end

  def invoices
    @invoices_results ||= repository.parent_engine.invoice_repository.find_all_by_merchant_id(id)
  end

  def invoice_items
    items
    @invoice_items_result ||= repository.parent_engine.invoice_item_repository.invoice_item.select do |invoice_item|
      @items_results.any? {|item| item.id == invoice_item.item_id}
    end
  end

  def transactions
    invoices
    @transactions_results ||= repository.parent_engine.transaction_repository.transaction.select do |transaction|
      @invoices_results.any? {|invoice| invoice.id == transaction.invoice_id }
    end
  end

  def successful_transactions
    transactions
    @successful_transactions_results ||= @transactions_results.select {|transaction| transaction.result == "success"}
  end

  def invoices_with_successful_transactions
    successful_transactions
    @successful_invoices_result ||= @invoices_results.select {|invoice| @successful_transactions_results.any?{|transaction| transaction.invoice_id == invoice.id}}
  end

  def invoice_items_with_successful_transactions
    invoice_items
    invoices_with_successful_transactions 
    @successful_invoice_items_result ||= @invoice_items_result.select {|invoice_item| @successful_invoices_result.any? {|invoice| invoice.id == invoice_item.invoice_id}}
  end

   def invoice_items_with_successful_transactions_by_date(date)
    invoices_with_successful_transactions
    @successful_invoices_by_date_result ||= @successful_invoices_result.select do |invoice|
      invoice.created_at == date
    end
  end

  def revenue(date = nil)
    sum = BigDecimal.new(0)
    invoice_items_with_successful_transactions
    date == nil ? revenue_no_date(sum) : revenue_with_date(sum, date)
  end

  def revenue_no_date(sum)
    sum_revenue(sum,@successful_invoice_items_result)
  end

  def revenue_with_date(sum, date)
    invoice_items_with_successful_transactions_by_date(date)
    @successful_invoice_items_by_date_result ||= @successful_invoice_items_result.select {|invoice_item| @successful_invoices_by_date_result.any? {|success| success.id == invoice_item.invoice_id}}
    sum_revenue(sum,@successful_invoice_items_by_date_result)
  end

  def sum_revenue(sum,invoice_items)
    invoice_items.each do |item| 
        sum += (item.quantity * BigDecimal.new(item.unit_price))
    end
    sum
  end

  def favorite_customer
    invoices_with_successful_transactions
    favorite_customer = @successful_invoices_result.map do |invoice|
      [(@successful_invoices_result.count {|success_invoice| success_invoice.customer_id == invoice.customer_id}), invoice.customer_id]
    end
    repository.parent_engine.customer_repository.find_by_id(favorite_customer.uniq.max[1])
  end


  # def best_day
  #   invoices_with_successful_transactions
  #   best_day = @successful_invoices_result.map do |invoice| 
  #     [(@successful_invoices_result.count {|success_invoice| success_invoice.created_at == invoice.created_at}), invoice.created_at]
  #   end
  #   best_day.uniq.uniq.max[1]
  # end
end









