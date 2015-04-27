class InvoiceItemRepository

  attr_accessor :invoice_items,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @invoice_items = data.map { |element| (InvoiceItem.new(self,element)) }
  end

  def inspect
    "#<#{self.class} #{invoice_items.size} rows>"
  end

  def all
    invoice_items
  end

  def random
    invoice_items.sample
  end

  def find_by_id(id)
    invoice_items.find { |data| data.id == id }
  end

  def find_by_item_id(id)
    invoice_items.find { |data| data.item_id == id }
  end

  def find_by_invoice_id(id)
    invoice_items.find { |data| data.invoice_id == id }
  end

  def find_all_by_id(id)
    invoice_items.find_all { |data| data.id == id }
  end

  def find_all_by_item_id(id)
    invoice_items.find_all { |data| data.item_id == id }
  end

  def find_all_by_invoice_id(id)
    invoice_items.find_all { |data| data.invoice_id == id }
  end
end
