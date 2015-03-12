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

  def dates_by_revenue(top_x = nil)
    dates = invoice_repo.find_dates_for_successful_invoices.uniq
    revenue_by_date = find_revenue_by_date(dates)
    sorted_revenue_by_date = sort_totals(revenue_by_date)
    return_dates_by_revenue(top_x, sorted_revenue_by_date)
  end

  private

  def invoice_repo
    parent_engine.invoice_repository
  end

  def return_dates_by_revenue(top_x, sorted_revenue_by_date)
    if top_x == nil
      sorted_revenue_by_date.map { |element| element[1] }
    else
      sorted_revenue_by_date[0..top_x-1].map { |element| element[1] }
    end
  end


  def find_revenue_by_date(dates)
    date_revenue = dates.map do |date|
      [revenue(date), date]
    end
  end

  def sort_totals(totals)
    totals.sort do |item_1,item_2|
      item_2.first <=> item_1.first
    end
  end

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

end
