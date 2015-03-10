# require './lib/invoice'
require_relative './invoice'

class InvoiceRepository

  attr_accessor :invoice,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @invoice = data.map {|element| (Invoice.new(self,element))}
  end

  def create(data)
    invoice_id = @invoice.last.id + 1
    create_invoice(data,invoice_id)
    create_invoice_items(data,invoice_id)
  end

  def create_invoice(data,invoice_id)
        @invoice << Invoice.new(parent_engine,
                            id: invoice_id,
                            customer_id: data[:customer].id,
                            merchant_id: data[:merchant].id,
                            status: "shipped",
                            created_at: Time.now.strftime("%d/%m/%Y %H:%M"),
                            updated_at: Time.now.strftime("%d/%m/%Y %H:%M")
                            )
  end

  def create_invoice_items(data,invoice_id)
    parent_engine.invoice_item_repository.create(data, invoice_id)
  end

  def all
      invoice
  end

  def random
      invoice.sample
  end

  def find_by_id(match)
      invoice.find {|data| data.id == match}
  end

  def find_by_customer_id(match)
      invoice.find {|data| data.customer_id == match}
  end

  def find_by_merchant_id(match)
      invoice.find {|data| data.merchant_id == match}
  end

  def find_by_status(match)
      invoice.find {|data| data.status.downcase == match.downcase}
  end

  def find_by_created_at(match)
      invoice.find {|data| data.created_at.downcase == match.downcase}
  end

  def find_by_updated_at(match)
      invoice.find {|data| data.updated_at.downcase == match.downcase}
  end

  def find_all_by_id(match)
      invoice.find_all {|data| data.id == match}
  end

  def find_all_by_customer_id(match)
      invoice.find_all {|data| data.customer_id == match}
  end

  def find_all_by_merchant_id(match)
      invoice.find_all {|data| data.merchant_id == match}
  end

  def find_all_by_status(match)
      invoice.find_all {|data| data.status.downcase == match.downcase}
  end

  def find_all_by_created_at(match)
      invoice.find_all {|data| data.created_at.downcase == match.downcase}
  end

  def find_all_by_updated_at(match)
      invoice.find_all {|data| data.updated_at.downcase == match.downcase}
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

end


if __FILE__ == $0
  invoice_repository = InvoiceRepository.new
  puts invoice_repository
end