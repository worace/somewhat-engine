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
    @id         = data[:id].to_i
    @item_id    = data[:item_id].to_i
    @invoice_id = data[:invoice_id].to_i
    @quantity   = data[:quantity].to_i
    @unit_price = data[:unit_price].to_d / 100
    @created_at = Date.parse(data[:created_at])
    @updated_at = Date.parse(data[:updated_at])
  end

  def invoice
    invoice_repository.find_by_id(invoice_id)
  end

  def item
    item_repository.find_by_id(item_id)
  end

  private

  def sales_engine
    repository.parent_engine
  end

  def invoice_repository
    sales_engine.invoice_repository
  end

  def item_repository
    sales_engine.item_repository
  end

end
