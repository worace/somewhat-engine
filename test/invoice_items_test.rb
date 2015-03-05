require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/invoice_items'
require_relative '../lib/invoice_items_repository'

class InvoiceItemsTest < Minitest::Test 

  def test_invoice_items_objects_have_a_repository
    invoice_items_repository = InvoiceItemsRepository.new
    invoice_items_repository.create_invoice_items_objects
    result = invoice_items_repository.invoice_items[0].repository
    assert_equal invoice_items_repository, result
  end

  def test_invoice_items_objects_have_a_fixnum_for_id
    invoice_items_repository = InvoiceItemsRepository.new
    invoice_items_repository.create_invoice_items_objects
    result = invoice_items_repository.invoice_items[0].id.class
    assert_equal Fixnum, result
  end

  def test_invoice_items_objects_have_a_fixnum_for_quantity
    invoice_items_repository = InvoiceItemsRepository.new
    invoice_items_repository.create_invoice_items_objects
    result = invoice_items_repository.invoice_items[0].quantity.class
    assert_equal Fixnum, result
  end

  def test_invoice_items_objects_have_a_string_for_created_at
    invoice_items_repository = InvoiceItemsRepository.new
    invoice_items_repository.create_invoice_items_objects
    result = invoice_items_repository.invoice_items[0].created_at.class
    assert_equal String, result
  end

  def test_invoice_items_objects_have_a_string_for_updated_at
    invoice_items_repository = InvoiceItemsRepository.new
    invoice_items_repository.create_invoice_items_objects
    result = invoice_items_repository.invoice_items[0].updated_at.class
    assert_equal String, result
  end

end
