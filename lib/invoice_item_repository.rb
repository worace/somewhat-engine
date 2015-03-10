# require './lib/invoice_item'
require_relative './invoice_item'

class InvoiceItemRepository

  attr_accessor :invoice_items,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @invoice_items = data.map {|element| (InvoiceItem.new(self,element))}
  end

  def create(data,invoice_id)
    item_count = sum_items(data[:items]).uniq
    item_count.each do |new_item|
      @invoice_items << InvoiceItem.new(parent_engine,
                                       id: @invoice_items.last.id + 1,
                                       item_id: new_item[1].id,
                                       invoice_id: invoice_id,
                                       quantity: new_item[0],
                                       unit_price: new_item[1].unit_price,
                                       created_at: Time.now.strftime("%d/%m/%Y %H:%M"),
                                       updated_at: Time.now.strftime("%d/%m/%Y %H:%M")
                                      )
    end
  end

  def sum_items(items)
    items.map do |item|
      [items.count {|item_num| item_num == item}, item]
    end
  end

  def all
      invoice_items
  end

  def random
      invoice_items.sample
  end

  def find_by_id(match)
      invoice_items.find {|data| data.id == match}
  end

  def find_by_item_id(match)  
      invoice_items.find {|data| data.item_id == match}
  end

  def find_by_invoice_id(match)
      invoice_items.find {|data| data.invoice_id == match}
  end

  def find_by_quantity(match)
      invoice_items.find {|data| data.quantity == match}
  end

  def find_by_unit_price(match)
      invoice_items.find {|data| data.unit_price == match}
  end

  def find_by_created_at(match)
      invoice_items.find {|data| data.created_at.downcase == match.downcase}
  end

  def find_by_updated_at(match)
      invoice_items.find {|data| data.updated_at.downcase == match.downcase}
  end

  def find_all_by_id(match)
      invoice_items.find_all {|data| data.id == match}
  end

  def find_all_by_item_id(match)
      invoice_items.find_all {|data| data.item_id == match}
  end

  def find_all_by_invoice_id(match)
      invoice_items.find_all {|data| data.invoice_id == match}
  end

  def find_all_by_quantity(match)
      invoice_items.find_all {|data| data.quantity == match}
  end

  def find_all_by_unit_price(match)  
      invoice_items.find_all {|data| data.unit_price == match}
  end

  def find_all_by_created_at(match)
      invoice_items.find_all {|data| data.created_at.downcase == match.downcase}
  end

  def find_all_by_updated_at(match)
      invoice_items.find_all {|data| data.updated_at.downcase == match.downcase}
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