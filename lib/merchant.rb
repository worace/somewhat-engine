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
    repository.parent_engine.item_repository.find_all_by_merchant_id(id).item
  end

  def invoices
    repository.parent_engine.invoice_repository.find_all_by_merchant_id(id).invoice
  end

end
