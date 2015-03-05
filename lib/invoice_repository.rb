require_relative './invoice_parser'
require_relative './invoice'

class InvoiceRepository

  attr_accessor :invoices,
                :parent_engine,
                :data_storage

  def initialize(sales_engine = nil)
    @parent_engine = sales_engine
    @invoices = []
    @invoice_parser = InvoiceParser.new
    @invoice_parser.read_invoice_data_from_csv_file
    create_invoice_objects
  end

  def create_invoice_objects
    @invoice_parser.invoice_data.each do |data|
      @invoices << Invoice.new(self,data)
    end
  end

  def clear_data_storage
    @data_storage = []
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
    clear_data_storage
    @data_storage = invoices.find_all do |data|
      data.id == match
    end
  end

  def find_all_by_customer_id(match)
    clear_data_storage
    @data_storage = invoices.find_all do |data|
      data.customer_id == match
    end
  end

  def find_all_by_merchant_id(match)
    clear_data_storage
    @data_storage = invoices.find_all do |data|
      data.merchant_id == match
    end
  end

  def find_all_by_status(match)
    clear_data_storage
    @data_storage = invoices.find_all do |data|
      data.status.downcase == match.downcase
    end
  end

  def find_all_by_created_at(match)
    clear_data_storage
    @data_storage = invoices.find_all do |data|
      data.created_at.downcase == match.downcase
    end
  end

  def find_all_by_updated_at(match)
    clear_data_storage
    @data_storage = invoices.find_all do |data|
      data.updated_at.downcase == match.downcase
    end
  end

end


if __FILE__ == $0
  invoice_repository = InvoiceRepository.new
  puts invoice_repository.invoices
end