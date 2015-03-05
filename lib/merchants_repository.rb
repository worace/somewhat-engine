require './lib/merchants_parser'
require './lib/merchants'

class MerchantRepository

  attr_accessor :merchants,
                :parent_engine

  def initialize(sales_engine = nil)
    @parent_engine = sales_engine
    @merchants = []
    @merchant_parser = MerchantParser.new
    @merchant_parser.read_merchant_data_from_csv_file
    create_merchant_objects
  end

  def create_merchant_objects
    @merchant_parser.merchant_data.each do |data|
      @merchants << Merchant.new(self,data)
    end
  end

  def all
    merchants
  end

  def random
    merchants.sample
  end

  def find_by_id(match)
    merchant_id ||= merchants.find do |data|
      data.id == match
    end
  end

  def find_by_name(match)
    merchant_name ||= merchants.find do |data|
      data.name.downcase == match.downcase
    end
  end

  def find_by_created_at(match)
    merchant_created ||= merchants.find do |data|
      data.created_at.downcase == match.downcase
    end
  end

  def find_by_updated_at(match)    
    merchant_updated ||= merchants.find do |data|
      data.updated_at.downcase == match.downcase
    end
  end

  def find_all_by_id(match)
    merchant_all_id ||= merchants.find_all do |data|
      data.id == match
    end
  end

  def find_all_by_name(match)
    merchant_all_name ||= merchants.find_all do |data|
      data.name.downcase == match.downcase
    end
  end

  def find_all_by_created_at(match)
    merchant_all_created ||= merchants.find_all do |data|
      data.created_at.downcase == match.downcase
    end
  end

  def find_all_by_updated_at(match)
    merchant_all_updated ||= merchants.find_all do |data|
      data.updated_at.downcase == match.downcase
    end
  end

end

if __FILE__ == $0
  merchant_repository = MerchantRepository.new
  puts merchant_repository.find_all_by_name("Williamson Group")
  puts merchant_repository.find_all_by_name("Hand-Spencer")
end