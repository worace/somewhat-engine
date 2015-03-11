require_relative './test_helper'

class InvoiceTest < Minitest::Spec

  @@flag = nil
  before do
    unless @@flag
      @@engine = SalesEngine.new("./data")
      @@engine.startup
      @@flag = true
    end
    @invoice = @@engine.invoice_repository.random
  end 
  
  def test_it_has_an_invoice_repository
    assert_equal InvoiceRepository, @invoice.repository.class
  end

  def test_it_has_an_id
    assert_equal Fixnum, @invoice.id.class
  end

  def test_it_has_a_customer_id
    assert_equal Fixnum, @invoice.customer_id.class
  end

  def test_it_has_a_merchant_id
    assert_equal Fixnum, @invoice.merchant_id.class
  end

  def test_it_has_a_status
    assert_equal "shipped", @invoice.status 
  end

  def test_it_can_retrieve_its_invoice_items
    assert @invoice.invoice_items.size > 1
    assert_equal InvoiceItem, @invoice.invoice_items[0].class
  end

  def test_it_can_retrieve_its_items
    assert @invoice.items.size > 1
    assert_equal Item, @invoice.items[0].class
  end

  def test_it_can_find_its_customer_object
    assert_equal Customer, @invoice.customer.class
  end

  def test_it_can_find_its_merchant_object
    assert_equal Merchant, @invoice.merchant.class
  end

  def test_it_can_find_transactions
    assert_equal Transaction, @invoice.transactions[0].class
  end
  
  def test_it_can_create_a_charge
    result = @@engine.transaction_repository.transactions.size
    @invoice.charge(credit_card_number: '1111222233334444',  credit_card_expiration_date: "10/14", result: "success")
    assert_equal @@engine.transaction_repository.transactions.size, result+1
  end

end
