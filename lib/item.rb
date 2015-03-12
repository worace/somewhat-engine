class Item

  attr_accessor :repository,
                :id,
                :name,
                :description,
                :unit_price,
                :merchant_id,
                :created_at,
                :updated_at

  def initialize(repository, data)
    @repository   = repository
    @id           = data[:id].to_i
    @name         = data[:name]
    @description  = data[:description]
    @unit_price   = data[:unit_price].to_d / 100
    @merchant_id  = data[:merchant_id].to_i
    @created_at   = Date.parse(data[:created_at])
    @updated_at   = Date.parse(data[:updated_at])
  end

  def merchant
    merchant_repo.find_by_id(merchant_id)
  end

  def best_day
    best_day = successful_invoices.map do |invoice|
      count_invoices(invoice)
    end
    best_day.uniq.uniq.max[1]
  end

  def items_sold
    successful_invoice_items.reduce(0) do |sum, item|
      sum += item.quantity
    end
  end

   def items_revenue
    successful_invoice_items.reduce(0) do |sum, item|
      sum += (item.quantity * item.unit_price)
    end
  end

  def invoice_items
    @invoice_items_result ||= invoice_item_repo.find_all_by_item_id(id)
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

  def merchant_repo
    sales_engine.merchant_repository
  end

  def transaction_repo
    sales_engine.transaction_repository
  end

  def count_invoices(invoice)
    count = successful_invoices.count do |success_invoice|
      success_invoice.created_at == invoice.created_at
    end
    [count, invoice.created_at]
  end

  # def successful_invoices
  #   invoice_items
  #   invoices
  #   transactions
  #   successful_transactions
  #   successful_invoices
  # end

  # def successful_invoice_items
  #   successful_invoices
  #   successful_invoice_items
  # end

  def successful_invoice_items
    @successful_invoice_items_result ||= invoice_items.select do |invoice_item|
      successful_invoices.any? do |invoice|
        invoice.id == invoice_item.invoice_id
      end
    end
  end

  def successful_invoices
    @successful_invoices_result ||= invoices.select do |invoice|
      successful_transactions.any? do |entry|
        entry.invoice_id == invoice.id
      end
    end
  end

  def successful_transactions
    @successful_transactions_result ||= transactions.select do |entry|
      entry.result == "success"
    end
  end

  def transactions
    @transactions_result ||= transaction_repo.transactions.select do |entry|
      invoices.any? { |invoice| invoice.id == entry.invoice_id }
    end
  end

  def invoices
    @invoices_result ||= invoice_repo.invoices.select do |invoice|
      invoice_items.any? do |invoice_item|
        invoice_item.invoice_id == invoice.id
      end
    end
  end

end
