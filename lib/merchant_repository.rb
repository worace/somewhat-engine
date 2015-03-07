# require './lib/merchant'
require_relative './merchant'

class MerchantRepository

  attr_accessor :merchant,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @merchant = data.map do |element|
      (element.kind_of? Merchant) ? element : (Merchant.new(self,element))
    end
  end

  def all
    MerchantRepository.new(
      merchant,
      parent_engine
    )
  end

  def random
    MerchantRepository.new(
      [merchant.sample],
      parent_engine
    )
  end

  def find_by_id(match)
    MerchantRepository.new(
      [merchant.find {|data| data.id == match}],
      parent_engine
    )
  end

  def find_by_name(match)
    MerchantRepository.new(
      [merchant.find {|data| data.name.downcase == match.downcase}],
      parent_engine
    )
  end

  def find_by_created_at(match)
    MerchantRepository.new(
      [merchant.find {|data| data.created_at.downcase == match.downcase}],
      parent_engine
    )
  end

  def find_by_updated_at(match)    
    MerchantRepository.new(
      [merchant.find {|data| data.updated_at.downcase == match.downcase}],
      parent_engine
    )
  end

  def find_all_by_id(match)
    MerchantRepository.new(
      merchant.find_all {|data| data.id == match},
      parent_engine
    )
  end

  def find_all_by_name(match)
    MerchantRepository.new( 
      merchant.find_all {|data| data.name.downcase == match.downcase},
      parent_engine
    )
  end

  def find_all_by_created_at(match)
    MerchantRepository.new(
      merchant.find_all {|data| data.created_at.downcase == match.downcase},
      parent_engine
    )
  end

  def find_all_by_updated_at(match)
    MerchantRepository.new(
      merchant.find_all {|data| data.updated_at.downcase == match.downcase},
      parent_engine
    )
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

end

if __FILE__ == $0
  merchant_repository = MerchantRepository.new
  puts merchant_repository.find_all_by_name("Williamson Group")
end