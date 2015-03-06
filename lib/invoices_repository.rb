require './lib/invoices'

class InvoiceRepository

  attr_accessor :invoices,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @invoices = data.map do |element|
      (element.kind_of? Invoice) ? element : (Invoice.new(self,element))
    end
  end

  def all
    InvoiceRepository.new(
      invoices,
      parent_engine
    )
  end

  def random
    InvoiceRepository.new(
      [invoices.sample],
      parent_engine
    )
  end

  def find_by_id(match)
    InvoiceRepository.new(
      [invoices.find {|data| data.id == match}],
      parent_engine
    )
  end

  def find_by_customer_id(match)
    InvoiceRepository.new(
      [invoices.find {|data| data.customer_id == match}],
      parent_engine
    )
  end

  def find_by_merchant_id(match)
    InvoiceRepository.new(
      [invoices.find {|data| data.merchant_id == match}],
      parent_engine
    )
  end

  def find_by_status(match)
    InvoiceRepository.new(
      [invoices.find {|data| data.status.downcase == match.downcase}],
      parent_engine
    )
  end

  def find_by_created_at(match)
    InvoiceRepository.new(
      [invoices.find {|data| data.created_at.downcase == match.downcase}],
      parent_engine
    )
  end

  def find_by_updated_at(match)
    InvoiceRepository.new(
      [invoices.find {|data| data.updated_at.downcase == match.downcase}],
      parent_engine
    )
  end

  def find_all_by_id(match)
    InvoiceRepository.new(
      invoices.find_all {|data| data.id == match},
      parent_engine
    )
  end

  def find_all_by_customer_id(match)
    InvoiceRepository.new(
      invoices.find_all {|data| data.customer_id == match},
      parent_engine
    )
  end

  def find_all_by_merchant_id(match)
    InvoiceRepository.new(
      invoices.find_all {|data| data.merchant_id == match},
      parent_engine
    )
  end

  def find_all_by_status(match)
    InvoiceRepository.new(
      invoices.find_all {|data| data.status.downcase == match.downcase},
      parent_engine
    )
  end

  def find_all_by_created_at(match)
    InvoiceRepository.new(
      invoices.find_all {|data| data.created_at.downcase == match.downcase},
      parent_engine
    )
  end

  def find_all_by_updated_at(match)
    InvoiceRepository.new(
      invoices.find_all {|data| data.updated_at.downcase == match.downcase},
      parent_engine
    )
  end

end


if __FILE__ == $0
  invoice_repository = InvoiceRepository.new
  puts invoice_repository
end