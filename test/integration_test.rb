require_relative './test_helper'

class IntegrationTest < Minitest::Spec

  @@flag = nil
  before do
    unless @@flag
      @@engine = SalesEngine.new("./data")
      @@engine.startup
      @@flag = true
    end
  end

  def test_a_merchant_can_retrieve_an_array_of_associated_items
    merchant = @@engine.merchant_repository.merchants[0]
    assert_equal 15,merchant.items.size
    assert_equal Array,merchant.items.class
  end

  def test_a_merchant_can_retrieve_an_array_of_associated_invoices
    merchant = @@engine.merchant_repository.merchants[0]
    assert_equal 59,merchant.invoices.size
    assert_equal Array,merchant.invoices.class
  end

  def test_an_invoice_can_retrieve_an_array_of_associated_transactions
    invoice = @@engine.invoice_repository.invoices[0]
    assert_equal 1,invoice.transactions.size
    assert_equal Array,invoice.transactions.class
  end

  def test_an_invoice_can_retrieve_an_array_of_associated_invoice_items
    invoice = @@engine.invoice_repository.invoices[0]
    assert_equal 8,invoice.invoice_items.size
    assert_equal Array,invoice.invoice_items.class
  end

  def test_an_invoice_can_retrieve_an_array_of_associated_items
    invoice = @@engine.invoice_repository.invoices[2]
    assert_equal 5,invoice.items.size
    assert_equal Array,invoice.items.class
  end

  def test_an_invoice_can_retrieve_an_instance_of_associated_customer
    invoice = @@engine.invoice_repository.invoices[0]
    assert_equal Customer,invoice.customer.class
  end

  def test_an_invoice_can_retrieve_an_instance_of_associated_merchant
    invoice = @@engine.invoice_repository.invoices[0]
    assert_equal Merchant,invoice.merchant.class
  end

  def test_an_invoice_item_can_retrieve_an_instance_of_associated_invoice
    invoice_item = @@engine.invoice_item_repository.invoice_items[0]
    assert_equal Invoice,invoice_item.invoice.class
  end

  def test_an_invoice_item_can_retrieve_an_instance_of_associated_item
    invoice_item = @@engine.invoice_item_repository.invoice_items[0]
    assert_equal Item,invoice_item.item.class
  end

  def test_an_item_can_retrieve_a_collection_of_asociated_invoice_items
    item = @@engine.item_repository.items[0]
    assert_equal 24,item.invoice_items.size
    assert_equal Array,item.invoice_items.class
  end

  def test_an_item_can_retrieve_an_instance_of_associated_merchant
    item = @@engine.item_repository.items[0]
    assert_equal Merchant,item.merchant.class
  end

  def test_a_transaction_can_retrieve_an_instance_of_associated_invoice
    transaction = @@engine.transaction_repository.transactions[0]
    assert_equal Invoice,transaction.invoice.class
  end

  def test_a_customer_can_retrieve_an_instance_of_associated_invoice
    customer = @@engine.customer_repository.customers[0]
    assert_equal Invoice,customer.invoices[0].class
  end

end