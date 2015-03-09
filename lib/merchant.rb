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
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  def items
    items = repository.parent_engine.item_repository.find_all_by_merchant_id(id)
  end

  def invoices
    invoices = repository.parent_engine.invoice_repository.find_all_by_merchant_id(id)
  end

  def revenue
    sum = BigDecimal.new(0)
    invoice_items.each do |item| 
      if successful_transactions.any? {|transaction| transaction.invoice_id == item.id}
        sum += (item.quantity * item.unit_price)
      end
    end
    sum
  end

  def invoice_items
    merchant_invoice_items = []
    repository.parent_engine.invoice_item_repository.invoice_item.select do |invoice_item|
      if invoices.any? {|invoice| invoice.id == invoice_item.invoice_id } 
        merchant_invoice_items << invoice_item 
      end
    end
  end

  def successful_transactions
    successful_transactions = repository.parent_engine.transaction_repository.transaction.select {|transaction| transaction.result == "success"}
  end

end

# CustomerRepository.new(                                                      
#       customers.find_all { |data| data.first_name.downcase == match.downcase },  
#       parent_engine                                                              
#     )  


