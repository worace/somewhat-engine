require './lib/merchants'

class MerchantRepository

  attr_accessor :merchants,
                :parent_engine

  def initialize(data, sales_engine = nil)
    @parent_engine = sales_engine
    @merchants = data.map do |element|
      (element.kind_of? Merchant) ? element : (Merchant.new(self,element))
      # if element.kind_of? Merchant
      #   element
      # else 
      #   Merchant.new(self, element)
      # end
    end
  end

  def all
    merchants
  end

  def random
    merchants.sample
  end

  def find_by_id(match)
    merchants.find {|data| data.id == match}
  end

  def find_by_name(match)
    merchants.find {|data| data.name.downcase == match.downcase}
  end

  def find_by_created_at(match)
    merchants.find {|data| data.created_at.downcase == match.downcase}
  end

  def find_by_updated_at(match)    
    merchants.find {|data| data.updated_at.downcase == match.downcase}
  end

  def find_all_by_id(match)
    merchants.find_all {|data| data.id == match}
  end

  def find_all_by_name(match)
    MerchantRepository.new( 
      merchants.find_all {|data| data.name.downcase == match.downcase},
      parent_engine
    )
  end

  def find_all_by_created_at(match)
    merchants.find_all {|data| data.created_at.downcase == match.downcase}
  end

  def find_all_by_updated_at(match)
    merchants.find_all {|data| data.updated_at.downcase == match.downcase}
  end

end

if __FILE__ == $0
  merchant_repository = MerchantRepository.new
  puts merchant_repository.find_all_by_name("Williamson Group")
  #puts merchant_repository.find_all_by_name("Hand-Spencer")
end