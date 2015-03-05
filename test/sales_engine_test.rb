require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/sales_engine'
require_relative '../lib/merchant_repository'
require_relative '../lib/customer_repository'

class SalesEngineTest < Minitest::Test 

  def test_it_initializes_a_merchant_repository
    engine = SalesEngine.new
    engine.startup
    result = engine.merchant_repository.class
    assert_equal MerchantRepository, result
  end

  def test_it_initializes_a_customer_repository
    engine = SalesEngine.new
    engine.startup
    result = engine.customer_repository.class
    assert_equal CustomerRepository, result
  end

  def test_the_merchant_repository_knows_its_sales_engine_is_this_sales_engine
    engine = SalesEngine.new
    engine.startup
    result = engine.merchant_repository.parent_engine
    assert_equal engine.object_id, result.object_id
  end 

  def test_the_customer_repository_knows_its_sales_engine_is_this_sales_engine
    engine = SalesEngine.new
    engine.startup
    result = engine.customer_repository.parent_engine
    assert_equal engine.object_id, result.object_id
  end 

  # def test_the_merchant_repository_size_is_same_as_all
  #   engine = SalesEngine.new
  #   engine.startup
  #   result = engine.merchant_repository.merchants.size
  #   assert_equal engine.all(:merchant_repository).size, result
  # end

  # def test_the_customers_repository_size_is_same_as_all
  #   engine = SalesEngine.new
  #   engine.startup
  #   result = engine.customer_repository.customers.size
  #   assert_equal engine.all(:customer_repository).size, result
  # end

  # def test_the_merchant_repository_can_return_random_merchant
  #   engine = SalesEngine.new
  #   engine.startup
  #   result = engine.random(:merchant_repository).class
  #   assert_equal Merchant, result
  # end

  # def test_the_customers_repository_can_return_random_customer
  #   engine = SalesEngine.new
  #   engine.startup
  #   result = engine.random(:customer_repository).class
  #   assert_equal Customer, result
  # end



end