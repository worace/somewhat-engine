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
end
