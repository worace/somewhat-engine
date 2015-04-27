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
    @invoice = @repo.find_by_id(2198)
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

end