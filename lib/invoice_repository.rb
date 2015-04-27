class InvoiceRepository

  attr_accessor :invoices,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @invoices      = data.map { |element| (Invoice.new(self, element)) }
  end

  def inspect
    "#<#{self.class} #{invoices.size} rows>"
  end

  def all
    invoices
  end

  def random
    invoices.sample
  end

  def find_by_id(id)
    invoices.find { |data| data.id == id }
  end

  def find_by_customer_id(id)
    invoices.find { |data| data.customer_id == id }
  end

  def find_all_by_id(id)
    invoices.find_all { |data| data.id == id }
  end

  def find_all_by_customer_id(id)
    invoices.find_all { |data| data.customer_id == id }
  end

  def find_all_by_status(status)
    invoices.find_all { |data| data.status.downcase == status.downcase }
  end

  def transaction_repo
    parent_engine.transaction_repository
  end

  def invoice_item_repo
    parent_engine.invoice_item_repository
  end
end
