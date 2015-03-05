require 'csv'
require_relative './merchant_repository'
require_relative './customer_repository'

class SalesEngine

  attr_accessor :merchant_repository,
                :customer_repository

  def startup
    @merchant_repository = MerchantRepository.new(self)
    @customer_repository = CustomerRepository.new(self)
  end

  def all(repository_name)
    case repository_name
      when :merchant_repository then @merchant_repository.merchants
      when :customer_repository then @customer_repository.customers
    end
  end

  def random(repository_name)
    case repository_name
      when :merchant_repository then @merchant_repository.merchants.sample
      when :customer_repository then @customer_repository.customers.sample
    end
  end

end

if __FILE__ == $0

  engine = SalesEngine.new
  engine.startup
  puts engine.random(:customer_repository)
  # puts engine.all(:merchant_repository)
  # puts engine.all(:customer_repository)
end