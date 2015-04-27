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
    item_repo.find_all_by_merchant_id(id)
  end

  def invoice_items
    invoice_item_repo.invoice_items.select do |invoice_item|
      items.any? { |item| item.id == invoice_item.item_id }
    end
  end

  def invoices
    invoice_repo.find_all_by_merchant_id(id)
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

  def transaction_repo
    sales_engine.transaction_repository
  end

  def item_repo
    sales_engine.item_repository
  end

  def customer_repo
    sales_engine.customer_repository
  end
end
