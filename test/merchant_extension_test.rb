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
end