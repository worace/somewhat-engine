require_relative './test_helper'

class CustomerExtensionTest < Minitest::Spec

  @@flag = nil
  before do
    unless @@flag
      @@engine = SalesEngine.new("./data")
      @@engine.startup
      @@flag = true
    end
    @customer_repo = @@engine.customer_repository
    @customer = @customer_repo.customers[10]
  end 

  def test_it_can_find_days_between_activity
    result = @customer.days_since_activity
    date = @@engine.transaction_repository.transactions[0].created_at
    days_since = (Date.today.mjd - date.mjd) + 1
    assert_equal days_since, result
  end

  def test_it_returns_the_customers_invoices
    assert_equal Array, @customer.invoices.class
    assert_equal Invoice, @customer.invoices[0].class
  end

  def test_it_can_return_revenue_in_BigDecimal_for_a_customer
    revenue_total = @customer.revenue
    assert_equal BigDecimal, revenue_total.class
  end

  def test_it_returns_the_top_customer_by_revenue
    result = @customer_repo.most_revenue
    assert_equal "Leannon", result.last_name 
  end

  def test_it_can_sum_items_for_a_customer
    items_total = @customer.sum_items 
    assert_equal 97, items_total
  end

  def test_it_returns_the_top_customer_by_items
    result = @customer_repo.most_items
    assert_equal "Walter", result.last_name 
  end

  def test_it_returns_blank_array_if_customer_has_no_pending_invoices
    customer = @customer_repo.find_by_id(2)
    result = customer.pending_invoices
    assert_equal [], result
  end

  def test_it_returns_invoices_if_customer_has_no_pending_invoices
    customer = @customer_repo.find_by_id(11)
    result = customer.pending_invoices
    assert_equal Invoice, result[0].class
  end

end