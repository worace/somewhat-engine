class MerchantRepository

  attr_accessor :merchants,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @merchants     = data.map { |element| (Merchant.new(self,element)) }
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

  def all
      merchants
  end

  def random
      merchants.sample
  end

  def find_by_id(id)
      merchants.find { |data| data.id == id }
  end

  def find_by_name(name)
      merchants.find { |data| data.name.downcase == name.downcase }
  end

  def find_by_created_at(date)
      merchants.find { |data| data.created_at == date }
  end

  def find_by_updated_at(date)
      merchants.find { |data| data.updated_at == date }
  end

  def find_all_by_id(id)
      merchants.find_all { |data| data.id == id }
  end

  def find_all_by_name(name)
      merchants.find_all { |data| data.name.downcase == name.downcase }
  end

  def find_all_by_created_at(date)
      merchants.find_all { |data| data.created_at == date }
  end

  def find_all_by_updated_at(date)
      merchants.find_all { |data| data.updated_at == date }
  end

  def revenue(date)
    sum = BigDecimal.new(0)
    @merchants.each do |merchant|
      sum += merchant.revenue(date)
    end
    sum
  end

  def most_revenue(top_x)
    totals_by_revenue = find_total_revenue
    sorted_revenue = sort_totals(totals_by_revenue)
    sorted_revenue[0..(top_x-1)].map { |element| element[1] }
  end

  def most_items(top_x)
    totals_by_item = find_total_items
    sorted_items = sort_totals(totals_by_item)
    sorted_items[0..(top_x-1)].map { |element| element[1] }
  end

  private

  def find_total_revenue
    @most_revenue ||= @merchants.map do |merchant|
      [merchant.revenue, merchant]
    end
  end

  def find_total_items
    @most_items ||= @merchants.map do |merchant|
      [merchant.sum_items, merchant]
    end
  end

  def sort_totals(totals)
    totals.sort do |item_1,item_2|
      item_2.first <=> item_1.first
    end
  end

end
