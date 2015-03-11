class CustomerRepository

  attr_accessor :customers,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @customers     = data.map { |element| (Customer.new(self, element)) }
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
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
      customers.find { |data| data.created_at.downcase == date.downcase }
  end

  def find_by_updated_at(date)
      customers.find { |data| data.updated_at.downcase == date.downcase }
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
      customers.find_all { |data| data.created_at.downcase == date.downcase }
  end

  def find_all_by_updated_at(date)
      customers.find_all { |data| data.updated_at.downcase == date.downcase }
  end

end
