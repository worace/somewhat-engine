# require './lib/invoice_item'
require_relative './invoice_item'

class InvoiceItemRepository

  attr_accessor :invoice_item,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @invoice_item = data.map {|element| (InvoiceItem.new(self,element))}
  end

  def all
      invoice_item
  end

  def random
      invoice_item.sample
  end

  def find_by_id(match)
      invoice_item.find {|data| data.id == match}
  end

  def find_by_item_id(match)  
      invoice_item.find {|data| data.item_id == match}
  end

  def find_by_invoice_id(match)
      invoice_item.find {|data| data.invoice_id == match}
  end

  def find_by_quantity(match)
      invoice_item.find {|data| data.quantity == match}
  end

  def find_by_unit_price(match)
      invoice_item.find {|data| data.unit_price == match}
  end

  def find_by_created_at(match)
      invoice_item.find {|data| data.created_at.downcase == match.downcase}
  end

  def find_by_updated_at(match)
      invoice_item.find {|data| data.updated_at.downcase == match.downcase}
  end

  def find_all_by_id(match)
      invoice_item.find_all {|data| data.id == match}
  end

  def find_all_by_item_id(match)
      invoice_item.find_all {|data| data.item_id == match}
  end

  def find_all_by_invoice_id(match)
      invoice_item.find_all {|data| data.invoice_id == match}
  end

  def find_all_by_quantity(match)
      invoice_item.find_all {|data| data.quantity == match}
  end

  def find_all_by_unit_price(match)  
      invoice_item.find_all {|data| data.unit_price == match}
  end

  def find_all_by_created_at(match)
      invoice_item.find_all {|data| data.created_at.downcase == match.downcase}
  end

  def find_all_by_updated_at(match)
      invoice_item.find_all {|data| data.updated_at.downcase == match.downcase}
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

end

if __FILE__ == $0
  invoice_item_repository = InvoiceitemRepository.new
  puts invoice_item_repository.find_by_id(21687)
  puts invoice_item_repository.find_all_by_unit_price(13635)
end