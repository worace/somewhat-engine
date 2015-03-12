class CustomerRepository

  attr_accessor :customers,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @customers     = data.map { |element| (Customer.new(self, element)) }
  end

  def inspect
    "#<#{self.class} #{customers.size} rows>"
  end

  def all
    customers
  end

  def random
    customers.sample
  end

  def find_by_id(id)
    customers.find { |data| data.id == id }
  end

  def find_by_first_name(name)
    customers.find { |data| data.first_name.downcase == name.downcase }
  end

  def find_by_last_name(name)
    customers.find { |data| data.last_name.downcase == name.downcase }
  end

  def find_by_created_at(date)
    customers.find { |data| data.created_at == date }
  end

  def find_by_updated_at(date)
    customers.find { |data| data.updated_at == date }
  end

  def find_all_by_id(id)
    customers.find_all { |data| data.id == id }
  end

  def find_all_by_first_name(name)
    customers.find_all { |data| data.first_name.downcase == name.downcase }
  end

  def find_all_by_last_name(name)
    customers.find_all { |data| data.last_name.downcase == name.downcase }
  end

  def find_all_by_created_at(date)
    customers.find_all { |data| data.created_at == date }
  end

  def find_all_by_updated_at(date)
    customers.find_all { |data| data.updated_at == date }
  end

  def most_revenue
    totals_by_revenue = find_total_revenue
    sorted_revenue = sort_totals(totals_by_revenue)
    sorted_revenue[0][1]
  end

  def most_items
    totals_by_item = find_total_items
    sorted_items = sort_totals(totals_by_item)
    sorted_items[0][1]
  end

  private

  def find_total_revenue
    @most_revenue ||= @customers.map do |customer|
      [customer.revenue, customer]
    end
  end

  def find_total_items
    @most_items ||= @customers.map do |customer|
      [customer.sum_items, customer]
    end
  end

  def sort_totals(totals)
    totals.sort do |item_1,item_2|
      item_2.first <=> item_1.first
    end
  end

end
