require_relative './test_helper'

class MerchantExtensionTest < Minitest::Spec

  @@flag = nil
  before do
    unless @@flag
      @@engine = SalesEngine.new("./data")
      @@engine.startup
      @@flag = true
    end
    @merchant_repo = @@engine.merchant_repository
    @invoice_repo = @@engine.invoice_repository
  end 

  def test_it_can_return_an_array_of_successful_invoices
    result = @invoice_repo.find_dates_for_successful_invoices
    assert_equal Array, result.class
    assert_equal Date, result[0].class
  end

  def test_there_is_a_difference_between_successful_and_all_invoices
    result_1 = @invoice_repo.invoices.size
    result_2 = @invoice_repo.find_dates_for_successful_invoices.size
    assert result_1 != result_2
  end

  def test_it_can_return_an_array_of_unique_dates
    result_1 = @invoice_repo.find_dates_for_successful_invoices.size
    result_2 = @invoice_repo.find_dates_for_successful_invoices.uniq.size
    assert result_1 != result_2
  end

  def test_it_returns_multiple_dates
    result = @invoice_repo.find_dates_for_successful_invoices.uniq.size
    assert_equal 22, result
  end

  def test_it_can_find_revenue_by_date
    skip
    dates = @invoice_repo.find_dates_for_successful_invoices.uniq
    date_revenue = @merchant_repo.find_revenue_by_date(dates)
    assert_equal BigDecimal, date_revenue[0][0].class
    assert_equal Date, date_revenue[0][1].class
    assert_equal 22, date_revenue.size
  end

  def test_it_can_sort_by_date
    skip
    dates = @invoice_repo.find_dates_for_successful_invoices.uniq
    date_revenue = @merchant_repo.find_revenue_by_date(dates)
    sorted = @merchant_repo.sort_totals(date_revenue)
    assert_equal Date.parse("2012-03-09"), sorted[0][1] 
  end

  def test_it_returns_the_date_for_top_sales
    result = @merchant_repo.dates_by_revenue
    assert_equal Date.parse("2012-03-09"), result[0] 
  end

  def test_it_returns_the_top_x_dates_for_sales
    result = @merchant_repo.dates_by_revenue(5)
    assert_equal 5, result.size 
  end

  # def test_it_returns_sorted_dates
  #   date1 = Date.parse("2012-03-14")
  #   date2 = Date.parse("2012-03-16")
  #   dates = (date1..date2)
  #   result = @invoice_repo.find_range_of_dates_for_invoices(dates)
  #   assert_equal 3, result.uniq.size
  # end

end