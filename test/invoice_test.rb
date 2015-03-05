require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/invoice'
require_relative '../lib/invoice_repository'

class InvoiceTest < Minitest::Test 

  def test_invoice_objects_have_a_repository
    invoice_repository = InvoiceRepository.new
    invoice_repository.create_invoice_objects
    result = invoice_repository.invoices[0].repository
    assert_equal invoice_repository, result
  end

  def test_invoice_objects_have_a_fixnum_for_id
    invoice_repository = InvoiceRepository.new
    invoice_repository.create_invoice_objects
    result = invoice_repository.invoices[0].id.class
    assert_equal Fixnum, result
  end

  def test_invoice_objects_have_a_fixnum_for_customer_id
    invoice_repository = InvoiceRepository.new
    invoice_repository.create_invoice_objects
    result = invoice_repository.invoices[0].customer_id.class
    assert_equal Fixnum, result
  end

  def test_invoice_objects_have_a_fixnum_for_merchant_id
    invoice_repository = InvoiceRepository.new
    invoice_repository.create_invoice_objects
    result = invoice_repository.invoices[0].merchant_id.class
    assert_equal Fixnum, result
  end

  def test_invoice_objects_have_a_string_for_status
    invoice_repository = InvoiceRepository.new
    invoice_repository.create_invoice_objects
    result = invoice_repository.invoices[0].status.class
    assert_equal String, result
  end

  def test_invoice_objects_have_a_string_for_created_at
    invoice_repository = InvoiceRepository.new
    invoice_repository.create_invoice_objects
    result = invoice_repository.invoices[0].created_at.class
    assert_equal String, result
  end

  def test_invoice_objects_have_a_string_for_updated_at
    invoice_repository = InvoiceRepository.new
    invoice_repository.create_invoice_objects
    result = invoice_repository.invoices[0].updated_at.class
    assert_equal String, result
  end

end
