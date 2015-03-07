require './lib/invoice'
# require_relative './invoice'

class InvoiceRepository

  attr_accessor :invoice,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @invoice = data.map do |element|
      (element.kind_of? Invoice) ? element : (Invoice.new(self,element))
    end
  end

  def all
    InvoiceRepository.new(
      invoice,
      parent_engine
    )
  end

  def random
    InvoiceRepository.new(
      [invoice.sample],
      parent_engine
    )
  end

  def find_by_id(match)
    InvoiceRepository.new(
      [invoice.find {|data| data.id == match}],
      parent_engine
    )
  end

  def find_by_customer_id(match)
    InvoiceRepository.new(
      [invoice.find {|data| data.customer_id == match}],
      parent_engine
    )
  end

  def find_by_merchant_id(match)
    InvoiceRepository.new(
      [invoice.find {|data| data.merchant_id == match}],
      parent_engine
    )
  end

  def find_by_status(match)
    InvoiceRepository.new(
      [invoice.find {|data| data.status.downcase == match.downcase}],
      parent_engine
    )
  end

  def find_by_created_at(match)
    InvoiceRepository.new(
      [invoice.find {|data| data.created_at.downcase == match.downcase}],
      parent_engine
    )
  end

  def find_by_updated_at(match)
    InvoiceRepository.new(
      [invoice.find {|data| data.updated_at.downcase == match.downcase}],
      parent_engine
    )
  end

  def find_all_by_id(match)
    InvoiceRepository.new(
      invoice.find_all {|data| data.id == match},
      parent_engine
    )
  end

  def find_all_by_customer_id(match)
    InvoiceRepository.new(
      invoice.find_all {|data| data.customer_id == match},
      parent_engine
    )
  end

  def find_all_by_merchant_id(match)
    InvoiceRepository.new(
      invoice.find_all {|data| data.merchant_id == match},
      parent_engine
    )
  end

  def find_all_by_status(match)
    InvoiceRepository.new(
      invoice.find_all {|data| data.status.downcase == match.downcase},
      parent_engine
    )
  end

  def find_all_by_created_at(match)
    InvoiceRepository.new(
      invoice.find_all {|data| data.created_at.downcase == match.downcase},
      parent_engine
    )
  end

  def find_all_by_updated_at(match)
    InvoiceRepository.new(
      invoice.find_all {|data| data.updated_at.downcase == match.downcase},
      parent_engine
    )
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

end


if __FILE__ == $0
  invoice_repository = InvoiceRepository.new
  puts invoice_repository
end