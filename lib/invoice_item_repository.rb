require './lib/invoice_item'
#require_relative './invoice_item'

class InvoiceItemRepository

  attr_accessor :invoice_item,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @invoice_item = data.map do |element|
      (element.kind_of? InvoiceItem) ? element : (InvoiceItem.new(self,element))
    end
  end

  def all
    InvoiceItemRepository.new(
      invoice_item,
      parent_engine
    )
  end

  def random
    InvoiceItemRepository.new(
      [invoice_item.sample],
      parent_engine
    )
  end

  def find_by_id(match)
    InvoiceItemRepository.new(
      [invoice_item.find {|data| data.id == match}],
      parent_engine
    )
  end

  def find_by_item_id(match)  
    InvoiceItemRepository.new(
      [invoice_item.find {|data| data.item_id == match}],
      parent_engine
    )
  end

  def find_by_invoice_id(match)
    InvoiceItemRepository.new(
      [invoice_item.find {|data| data.invoice_id == match}],
      parent_engine
    )
  end

  def find_by_quantity(match)
    InvoiceItemRepository.new(
      [invoice_item.find {|data| data.quantity == match}], 
      parent_engine
    )
  end

  def find_by_unit_price(match)
    InvoiceItemRepository.new(
      [invoice_item.find {|data| data.unit_price == match}],
      parent_engine  
    )
  end

  def find_by_created_at(match)
    InvoiceItemRepository.new(
      [invoice_item.find {|data| data.created_at.downcase == match.downcase}],
      parent_engine
    )
  end

  def find_by_updated_at(match)
    InvoiceItemRepository.new(
      [invoice_item.find {|data| data.updated_at.downcase == match.downcase}],
      parent_engine
    )
  end

  def find_all_by_id(match)
    InvoiceItemRepository.new(
      invoice_item.find_all {|data| data.id == match},
      parent_engine
    )
  end

  def find_all_by_item_id(match)
    InvoiceItemRepository.new(
      invoice_item.find_all {|data| data.item_id == match},
      parent_engine
    )
  end

  def find_all_by_invoice_id(match)
    InvoiceItemRepository.new(
      invoice_item.find_all {|data| data.invoice_id == match},
      parent_engine
    )
  end

  def find_all_by_quantity(match)
    InvoiceItemRepository.new(
      invoice_item.find_all {|data| data.quantity == match},
      parent_engine
    )
  end

  def find_all_by_unit_price(match)  
    InvoiceItemRepository.new(
      invoice_item.find_all {|data| data.unit_price == match},
      parent_engine
    )
  end

  def find_all_by_created_at(match)
    InvoiceItemRepository.new(
      invoice_item.find_all {|data| data.created_at.downcase == match.downcase},
      parent_engine
    )
  end

  def find_all_by_updated_at(match)
    InvoiceItemRepository.new(
      invoice_item.find_all {|data| data.updated_at.downcase == match.downcase},
      parent_engine
    )
  end

end

if __FILE__ == $0
  invoice_item_repository = InvoiceitemRepository.new
  puts invoice_item_repository.find_by_id(21687)
  puts invoice_item_repository.find_all_by_unit_price(13635)
end