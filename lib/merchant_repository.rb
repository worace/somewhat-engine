require_relative './merchant_parser'
require_relative './merchant'

class MerchantRepository

  attr_accessor :merchants,
                :sales_engine

  def initialize(sales_engine = nil)
    @sales_engine = sales_engine
    @merchants = []
    @merchant_parser = MerchantParser.new
    @merchant_parser.read_merchant_data_from_csv_file
  end

  def create_merchant_objects
    @merchant_parser.merchant_data.each do |data|
     @merchants << Merchant.new(self,data)
   end
 end

end


if __FILE__ == $0
  merchant_repository = MerchantRepository.new
  merchant_repository.create_merchant_objects
end