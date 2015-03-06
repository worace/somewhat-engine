require './lib/invoices'

class InvoiceRepository

  attr_accessor :invoices,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @invoices = []
    @data = data
    create_invoice_objects
  end

  def create_invoice_objects
    @data.invoice_data.each do |data|
      @invoices << Invoice.new(self,data)
    end
  end

  def all
    invoices
  end

  def random
    invoices.sample
  end

  def find_by_id(match)
    invoices.find do |data|
      data.id == match
    end
  end

  def find_by_customer_id(match)
    invoices.find do |data|
      data.customer_id == match
    end
  end

  def find_by_merchant_id(match)
    invoices.find do |data|
      data.merchant_id == match
    end
  end

  def find_by_status(match)
    invoices.find do |data|
      data.status.downcase == match.downcase
    end
  end

  def find_by_created_at(match)
    invoices.find do |data|
      data.created_at.downcase == match.downcase
    end
  end

  def find_by_updated_at(match)
    invoices.find do |data|
      data.updated_at.downcase == match.downcase
    end
  end

  def find_all_by_id(match)
    invoices.find_all do |data|
      data.id == match
    end
  end

  def find_all_by_customer_id(match)
    invoices.find_all do |data|
      data.customer_id == match
    end
  end

  def find_all_by_merchant_id(match)
    invoices.find_all do |data|
      data.merchant_id == match
    end
  end

  def find_all_by_status(match)
    invoices.find_all do |data|
      data.status.downcase == match.downcase
    end
  end

  def find_all_by_created_at(match)
    invoices.find_all do |data|
      data.created_at.downcase == match.downcase
    end
  end

  def find_all_by_updated_at(match)
    invoices.find_all do |data|
      data.updated_at.downcase == match.downcase
    end
  end

end


if __FILE__ == $0
  invoice_repository = InvoiceRepository.new
  puts invoice_repository.invoices
end