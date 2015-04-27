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

end
