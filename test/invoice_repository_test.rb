require_relative './test_helper'

class InvoiceRepositoryTest < Minitest::Spec

  @@flag = nil
  before do
    unless @@flag
      @@engine = SalesEngine.new("./data")
      @@engine.startup
      @@flag = true
    end
    @repo = @@engine.invoice_repository
    @invoice = @repo.random
  end 

  def test_the_repository_has_a_sales_engine
    assert_equal SalesEngine, @repo.parent_engine.class
  end

  def test_it_has_an_array_of_invoices
    assert_equal Array, @repo.invoices.class
    assert_equal Invoice, @repo.invoices[0].class
    assert @repo.invoices.size > 1
  end

  def test_it_can_retrieve_all_invoices
    result = @repo.invoices.size
    assert_equal result, @repo.all.size
  end

  def test_it_can_retrieve_a_random_invoice
    result_1 = @repo.random
    result_2 = @repo.random
    assert result_1 != result_2
  end 

  def test_it_can_find_an_invoice_by_id
    assert_equal @invoice, @repo.find_by_id(@invoice.id)
  end

  def test_it_can_find_an_invoice_by_customer_id
    assert_equal @invoice.customer_id, @repo.find_by_customer_id(@invoice.customer_id).customer_id
  end

  def test_it_can_find_an_invoice_by_merchant_id
    assert_equal @invoice.merchant_id, @repo.find_by_merchant_id(@invoice.merchant_id).merchant_id
  end

  def test_it_can_find_an_invoice_by_status
    assert_equal Invoice, @repo.find_by_status(@invoice.status).class
  end

  def test_it_can_find_an_invoice_by_created_at
    assert_equal @invoice.class, @repo.find_by_created_at(@invoice.created_at).class
  end

  def test_it_can_find_an_invoice_by_updated_at
    assert_equal @invoice.class, @repo.find_by_updated_at(@invoice.updated_at).class
  end

  def test_it_can_find_all_by_id
    assert_equal 1, @repo.find_all_by_id(@invoice.id).size
  end

  def test_it_can_find_all_by_customer_id
    assert @repo.find_all_by_customer_id(@invoice.customer_id).size > 1
  end

  def test_it_can_find_all_by_merchant_id
    assert @repo.find_all_by_merchant_id(@invoice.merchant_id).size > 1
  end

  def test_it_can_find_all_by_status
    assert @repo.find_all_by_status(@invoice.status).size > 1
  end

  def test_it_can_find_all_by_created_at
    assert @repo.find_all_by_created_at(@invoice.created_at).size > 1
  end

  def test_it_can_find_all_by_updated_at
    assert @repo.find_all_by_updated_at(@invoice.updated_at).size > 1
  end

  def test_it_can_create_an_invoice
    customer = @@engine.customer_repository.random
    merchant = @@engine.merchant_repository.random
    item = @@engine.item_repository.random
    items = [item, item, item]
    result = @repo.invoices.size
    @repo.create(customer: customer, merchant: merchant, items: items)
    assert_equal (@repo.invoices.size), result+1
  end

  def test_it_can_create_invoice_items
    customer = @@engine.customer_repository.random
    merchant = @@engine.merchant_repository.random
    item_1 = @@engine.item_repository.random
    item_2 = @@engine.item_repository.random
    items = [item_1, item_2, item_1]
    result = @@engine.invoice_item_repository.invoice_items.size
    @repo.create(customer: customer, merchant: merchant, items: items)
    assert_equal (@@engine.invoice_item_repository.invoice_items.size), result+2
  end

end