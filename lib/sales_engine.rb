require_relative './merchant_repository'
require_relative './customer_repository'

class SalesEngine

  attr_accessor :merchant_repository,
                :customer_repository

  def initialize
    @merchant_repository = MerchantRepository.new(self)
    @customer_repository = CustomerRepository.new(self)
  end

end

if __FILE__ == $0

  sales_engine = SalesEngine.new

end