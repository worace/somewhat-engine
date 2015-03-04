require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/sales_engine'
require_relative '../lib/merchant_repository'
require_relative '../lib/customer_repository'

class SalesEngineTest < Minitest::Test 

  def test_it_initializes_a_merchant_repository
    sales_engine = SalesEngine.new
    result = sales_engine.merchant_repository.class
    assert_equal MerchantRepository, result
  end

  def test_it_initializes_a_customer_repository
    sales_engine = SalesEngine.new
    result = sales_engine.customer_repository.class
    assert_equal CustomerRepository, result
  end

  def test_the_merchant_repository_knows_its_sales_engine_is_this_sales_engine
    sales_engine = SalesEngine.new
    result = sales_engine.merchant_repository.sales_engine
    assert_equal sales_engine.object_id, result.object_id
  end 

  def test_the_customer_repository_knows_its_sales_engine_is_this_sales_engine
    sales_engine = SalesEngine.new
    result = sales_engine.customer_repository.sales_engine
    assert_equal sales_engine.object_id, result.object_id
  end 

end