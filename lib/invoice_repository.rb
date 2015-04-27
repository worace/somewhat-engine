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

  def find_dates_for_successful_invoices
    successful_transactions
    successful_invoices
    map_dates_for_invoices
  end

  private

  def successful_transactions
    @transactions_result ||= transaction_repo.transactions.select do |entry|
      entry.result == "success"
    end
  end

  def successful_invoices
    @invoices_result ||= invoices.select do |invoice|
      successful_transactions.any? do |entry|
        entry.invoice_id == invoice.id
      end
    end
  end

  def map_dates_for_invoices
    @dates_result ||= successful_invoices.map do |invoice|
      invoice.created_at
    end
  end

  def transaction_repo
    parent_engine.transaction_repository
  end

  def invoice_item_repo
    parent_engine.invoice_item_repository
  end
end
