require './lib/merchants'

class MerchantRepository

  attr_accessor :merchants,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @merchants = data.map do |element|
      (element.kind_of? Merchant) ? element : (Merchant.new(self,element))
    end
  end

  def all
    MerchantRepository.new(
      merchants,
      parent_engine
    )
  end

  def random
    MerchantRepository.new(
      [merchants.sample],
      parent_engine
    )
  end

  def find_by_id(match)
    MerchantRepository.new(
      [merchants.find {|data| data.id == match}],
      parent_engine
    )
  end

  def find_by_name(match)
    MerchantRepository.new(
      [merchants.find {|data| data.name.downcase == match.downcase}],
      parent_engine
    )
  end

  def find_by_created_at(match)
    MerchantRepository.new(
      [merchants.find {|data| data.created_at.downcase == match.downcase}],
      parent_engine
    )
  end

  def find_by_updated_at(match)    
    MerchantRepository.new(
      [merchants.find {|data| data.updated_at.downcase == match.downcase}],
      parent_engine
    )
  end

  def find_all_by_id(match)
    MerchantRepository.new(
      merchants.find_all {|data| data.id == match},
      parent_engine
    )
  end

  def find_all_by_name(match)
    MerchantRepository.new( 
      merchants.find_all {|data| data.name.downcase == match.downcase},
      parent_engine
    )
  end

  def find_all_by_created_at(match)
    MerchantRepository.new(
      merchants.find_all {|data| data.created_at.downcase == match.downcase},
      parent_engine
    )
  end

  def find_all_by_updated_at(match)
    MerchantRepository.new(
      merchants.find_all {|data| data.updated_at.downcase == match.downcase},
      parent_engine
    )
  end

end

if __FILE__ == $0
  merchant_repository = MerchantRepository.new
  puts merchant_repository.find_all_by_name("Williamson Group")
end