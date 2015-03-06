class InvoiceItem

  attr_accessor :repository,
                :id,
                :item_id,
                :invoice_id,
                :quantity,
                :unit_price,
                :created_at,
                :updated_at

  def initialize(repository, data)
    @repository = repository
    @id = data[:id].to_i
    @item_id = data[:item_id].to_i
    @invoice_id = data[:invoice_id].to_i
    @quantity = data[:quantity].to_i
    @unit_price = data[:unit_price].to_i
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  def invoice
    repository.parent_engine.invoices_repository.find_by_id(invoice_id).invoices[0]
  end

  def item
    repository.parent_engine.items_repository.find_by_id(item_id).items[0]
  end

end
