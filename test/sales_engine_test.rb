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

  def test_the_invoice_repository_knows_its_sales_engine_is_this_sales_engine
    engine = SalesEngine.new
    engine.startup
    result = engine.invoice_repository.parent_engine
    assert_equal engine.object_id, result.object_id
  end

  def test_the_item_repository_knows_its_sales_engine_is_this_sales_engine
    engine = SalesEngine.new
    engine.startup
    result = engine.item_repository.parent_engine
    assert_equal engine.object_id, result.object_id
  end

end