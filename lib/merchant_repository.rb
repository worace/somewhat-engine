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
end
