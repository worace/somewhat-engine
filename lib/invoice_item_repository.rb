class InvoiceItemRepository

  attr_accessor :invoice_items,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @invoice_items = data.map { |element| (InvoiceItem.new(self,element)) }
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

  def create(data,invoice_id)
    items = count_items(data)
    items.each do |new_item|
      invoice_items << add_invoice_item(new_item,invoice_id)
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

  def find_by_id(id)
    invoice_items.find { |data| data.id == id }
  end

  def find_by_item_id(id)
    invoice_items.find { |data| data.item_id == id }
  end

  def find_by_invoice_id(id)
    invoice_items.find { |data| data.invoice_id == id }
  end

  def find_by_quantity(quantity)
    invoice_items.find { |data| data.quantity == quantity }
  end

  def find_by_unit_price(price)
    invoice_items.find { |data| data.unit_price == price }
  end

  def find_by_created_at(date)
    invoice_items.find { |data| data.created_at.downcase == date.downcase }
  end

  def find_by_updated_at(date)
    invoice_items.find { |data| data.updated_at.downcase == date.downcase }
  end

  def find_all_by_id(id)
    invoice_items.find_all { |data| data.id == id }
  end

  def find_all_by_item_id(id)
    invoice_items.find_all { |data| data.item_id == id }
  end

  def find_all_by_invoice_id(id)
    invoice_items.find_all { |data| data.invoice_id == id }
  end

  def find_all_by_quantity(quantity)
    invoice_items.find_all { |data| data.quantity == quantity }
  end

  def find_all_by_unit_price(price)
    invoice_items.find_all { |data| data.unit_price == price }
  end

  def find_all_by_created_at(date)
    invoice_items.find_all { |data| data.created_at.downcase == date.downcase }
  end

  def find_all_by_updated_at(date)
    invoice_items.find_all { |data| data.updated_at.downcase == date.downcase }
  end

  private

  def count_items(data)
    item_count = sum_items(data[:items]).uniq
  end

  def add_invoice_item(new_item, invoice_id)
    InvoiceItem.new(self,
                    id: invoice_items.last.id + 1,
                    item_id: new_item[1].id,
                    invoice_id: invoice_id,
                    quantity: new_item[0],
                    unit_price: new_item[1].unit_price,
                    created_at: Time.now.strftime("%d/%m/%Y %H:%M"),
                    updated_at: Time.now.strftime("%d/%m/%Y %H:%M")
                    )
  end

end
