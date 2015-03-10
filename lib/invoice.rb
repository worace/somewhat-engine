require 'date'

class Invoice

  attr_accessor :repository,
                :id,
                :customer_id,
                :merchant_id,
                :status,
                :created_at,
                :updated_at

  def initialize(repository, data)
    @repository  = repository
    @id          = data[:id].to_i
    @customer_id = data[:customer_id].to_i
    @merchant_id = data[:merchant_id].to_i
    @status      = data[:status]
    @created_at  = Date.parse(data[:created_at])
    @updated_at  = Date.parse(data[:updated_at])
  end

  def transactions 
    transaction_repository.find_all_by_invoice_id(id)
  end

  def charge(data)
    transaction_repository.run_credit_card(data, id)
  end

  def invoice_items
    get_invoice_items_for_self
  end

  def items
    @items_result ||= get_invoice_items_for_self.map do |item| 
      item_repository.find_by_id(item.item_id) 
    end
    @items_result.uniq
  end

  def get_invoice_items_for_self
    invoice_item_repository.find_all_by_invoice_id(id)
  end

  def customer
    customer_repository.find_by_id(customer_id)
  end

  def merchant
    merchant_repository.find_by_id(merchant_id)
  end

  private

  def sales_engine
    repository.parent_engine
  end

  def transaction_repository
    sales_engine.transaction_repository
  end    

  def item_repository
    sales_engine.item_repository
  end

  def invoice_item_repository
    sales_engine.invoice_item_repository
  end

  def merchant_repository
    sales_engine.merchant_repository
  end
  
  def customer_repository
    sales_engine.customer_repository
  end  

end
