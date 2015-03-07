require './test/test_helper'

class IntegrationTest < Minitest::Test 

  def test_a_merchant_can_retrieve_an_array_of_associated_items
    engine = SalesEngine.new("./data/")
    engine.startup
    merchant = engine.merchant_repository.merchant[0]
    assert_equal 15,merchant.items.size
    assert_equal Array,merchant.items.class
  end

  def test_a_merchant_can_retrieve_an_array_of_associated_invoices
    engine = SalesEngine.new("./data/")
    engine.startup
    merchant = engine.merchant_repository.merchant[0]
    assert_equal 59,merchant.invoices.size
    assert_equal Array,merchant.invoices.class
  end

  def test_an_invoice_can_retrieve_an_array_of_associated_transactions
    engine = SalesEngine.new("./data/")
    engine.startup
    invoice = engine.invoice_repository.invoice[0]
    assert_equal 1,invoice.transactions.size
    assert_equal Array,invoice.transactions.class
  end

  def test_an_invoice_can_retrieve_an_array_of_associated_invoice_items
    engine = SalesEngine.new("./data/")
    engine.startup
    invoice = engine.invoice_repository.invoice[0]
    assert_equal 8,invoice.invoice_items.size
    assert_equal Array,invoice.invoice_items.class
  end

  def test_an_invoice_can_retrieve_an_array_of_associated_items
    engine = SalesEngine.new("./data/")
    engine.startup
    invoice = engine.invoice_repository.invoice[2]
    assert_equal 5,invoice.items.size
    assert_equal Array,invoice.items.class
  end

  def test_an_invoice_can_retrieve_an_instance_of_associated_customer
    engine = SalesEngine.new("./data/")
    engine.startup
    invoice = engine.invoice_repository.invoice[0]
    assert_equal Customer,invoice.customer.class
  end

  def test_an_invoice_can_retrieve_an_instance_of_associated_merchant
    engine = SalesEngine.new("./data/")
    engine.startup
    invoice = engine.invoice_repository.invoice[0]
    assert_equal Merchant,invoice.merchant.class
  end

  def test_an_invoice_item_can_retrieve_an_instance_of_associated_invoice
    engine = SalesEngine.new("./data/")
    engine.startup
    invoice_item = engine.invoice_item_repository.invoice_item[0]
    assert_equal Invoice,invoice_item.invoice.class
  end

  def test_an_invoice_item_can_retrieve_an_instance_of_associated_item
    engine = SalesEngine.new("./data/")
    engine.startup
    invoice_item = engine.invoice_item_repository.invoice_item[0]
    assert_equal Item,invoice_item.item.class
  end

  def test_an_item_can_retrieve_a_collection_of_asociated_invoice_items
    engine = SalesEngine.new("./data/")
    engine.startup
    item = engine.item_repository.item[0]
    assert_equal 24,item.invoice_items.size
    assert_equal Array,item.invoice_items.class 
  end    

  def test_an_item_can_retrieve_an_instance_of_associated_merchant
    engine = SalesEngine.new("./data/")
    engine.startup
    item = engine.item_repository.item[0]
    assert_equal Merchant,item.merchant.class
  end

  def test_a_transaction_can_retrieve_an_instance_of_associated_invoice
    engine = SalesEngine.new("./data/")
    engine.startup
    transaction = engine.transaction_repository.transaction[0]
    assert_equal Invoice,transaction.invoice.class
  end    

  def test_a_customer_can_retrieve_an_instance_of_associated_invoice
    engine = SalesEngine.new("./data/")
    engine.startup
    customer = engine.customer_repository.customer[0]
    assert_equal Invoice,customer.invoices.class
  end  

end