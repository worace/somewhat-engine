require_relative './test_helper'

class MerchantTest < Minitest::Spec

	@@flag = nil
  before do
    unless @@flag
      @@engine = SalesEngine.new("./data")
      @@engine.startup
      @@flag = true
    end
    @merchant = @@engine.merchant_repository.find_by_id(1)
  end 

  def test_it_has_a_merchant_repository
  	assert_equal MerchantRepository, @merchant.repository.class
  end

  def test_it_has_an_id
  	assert_equal Fixnum, @merchant.id.class
  end

  def test_it_has_a_name
  	assert_equal String, @merchant.name.class
  end

  def test_it_has_a_created_at_date
  	assert_equal Date, @merchant.created_at.class 
  end

  def test_it_has_an_updated_at_date
  	assert_equal Date, @merchant.updated_at.class
  end

  def test_it_returns_the_merchants_items
  	assert_equal Array, @merchant.items.class
  	assert_equal Item, @merchant.items[0].class
  end

  def test_it_returns_the_merchants_invoice_items
  	assert_equal Array, @merchant.invoice_items.class
  	assert_equal InvoiceItem, @merchant.invoice_items[0].class
  end

	def test_it_returns_the_merchants_invoice
  	assert_equal Array, @merchant.invoices.class
  	assert_equal Invoice, @merchant.invoices[0].class
  end

  def test_it_can_return_revenue_in_BigDecimal
  	merchant = @@engine.merchant_repository.merchants[10]
  	revenue_total = merchant.revenue
  	assert_equal BigDecimal, revenue_total.class
  end

  def test_it_can_return_revenue_with_no_date
  	merchant = @@engine.merchant_repository.merchants[10]
  	revenue_total = merchant.revenue
  	assert_equal BigDecimal.new("385783.75"), revenue_total
  end

  def test_it_can_return_revenue_given_a_date
  	merchant = @@engine.merchant_repository.merchants[10]
  	date = Date.parse("2012-03-27")
  	revenue_total = merchant.revenue(date)
  	assert_equal BigDecimal.new("3095.31"), revenue_total
  end

  def test_it_can_return_a_favorite_customer
  	merchant = @@engine.merchant_repository.merchants[10]
  	result = merchant.favorite_customer.last_name  
  	assert_equal "Bergstrom", result
  end

  def test_it_can_return_customers_with_pending_invoices
  	merchant = @@engine.merchant_repository.merchants[50]
  	result = merchant.customers_with_pending_invoices 
  	assert_equal Customer, result[0].class
  	assert_equal 4, result.size
  end

  def test_it_can_count_all_its_invoice_items
  	merchant = @@engine.merchant_repository.merchants[50]
  	result = merchant.sum_items
  	assert_equal 1085, result
  end

end
