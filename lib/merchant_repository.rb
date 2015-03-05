require_relative './merchant_parser'
require_relative './merchant'

class MerchantRepository

  attr_accessor :merchants,
                :parent_engine,
                :data_storage

  def initialize(sales_engine = nil)
    @parent_engine = sales_engine
    @merchants = []
    @data_storage = []
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
    merchants.find do |data|
      data.id == match
    end
  end

  def find_by_name(match)
    merchants.find do |data|
      data.name.downcase == match.downcase
    end
  end

  def find_by_created_at(match)
    merchants.find do |data|
      data.created_at.downcase == match.downcase
    end
  end

  def find_by_updated_at(match)    
    merchants.find do |data|
      data.updated_at.downcase == match.downcase
    end
  end

  def find_all_by_id(match)
    @data_storage = merchants.find_all do |data|
      data.id == match
    end
  end

  def find_all_by_name(match)
    @data_storage = merchants.find_all do |data|
      data.name.downcase == match.downcase
    end
  end

  def find_all_by_created_at(match)
    @data_storage = merchants.find_all do |data|
      data.created_at.downcase == match.downcase
    end
  end

  def find_all_by_updated_at(match)
    @data_storage = merchants.find_all do |data|
      data.updated_at.downcase == match.downcase
    end
  end

end

if __FILE__ == $0
  # merchant_repository = MerchantRepository.new
  # puts merchant_repository.merchants   # Whats the diff between .merchants and .all ? None?
  # puts merchant_repository.all
  
  # puts merchant_repository.find_by_id(190)
  merchant_repository = MerchantRepository.new
  puts merchant_repository.find_all_by_name("Williamson Group").size
  puts merchant_repository.find_by_id(90)
  puts merchant_repository.find_all_by_name("Williamson Group").size
end