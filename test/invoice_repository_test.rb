require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test 

  def test_the_invoice_array_starts_empty
    skip
    invoice_repository = InvoiceRepository.new
    result = invoice_repository.invoices
    assert_equal result, []
  end

  def test_it_creates_an_array_of_objects
    invoice_repository = InvoiceRepository.new
    invoice_repository.create_invoice_objects
    result = invoice_repository.invoices.class
    assert_equal Array, result
  end

  def test_it_creates_an_array_of_invoice_objects_from_csv
    invoice_repository = InvoiceRepository.new
    invoice_repository.create_invoice_objects
    result = invoice_repository.invoices[0].class
    assert_equal Invoice, result
  end

  def test_invoice_objects_reflect_invoice_repository_as_their_repository
    invoice_repository = InvoiceRepository.new
    invoice_repository.create_invoice_objects
    result = invoice_repository.invoices[0].repository.class
    assert_equal InvoiceRepository, result
    result = invoice_repository.invoices[0].repository
    assert_equal invoice_repository, result
  end

  def test_invoice_can_return_all_the_invoice_objects
    invoice_repository = InvoiceRepository.new
    result = invoice_repository.invoices.size
    assert_equal invoice_repository.all.size, result
  end

  def test_invoice_can_return_a_random_invoice_object
    invoice_repository = InvoiceRepository.new
    result = invoice_repository.random.class
    assert_equal Invoice, result
  end

  def test_it_can_find_a_invoice_by_its_id
    invoice_repository = InvoiceRepository.new
    result = invoice_repository.invoices[4].object_id
    assert_equal invoice_repository.find_by_id(5).object_id, result
  end

  def test_it_will_return_nil_if_id_does_not_exist
    invoice_repository = InvoiceRepository.new
    assert_equal invoice_repository.find_by_id(100000), nil 
  end

  def test_it_can_find_a_invoice_by_its_customer_id
    invoice_repository = InvoiceRepository.new
    result = invoice_repository.invoices[0].object_id
    assert_equal invoice_repository.find_by_customer_id(1).object_id, result
  end

  def test_it_will_return_nil_if_customer_id_does_not_exist
    invoice_repository = InvoiceRepository.new
    assert_equal invoice_repository.find_by_customer_id(100000), nil 
  end

  def test_it_can_find_a_invoice_by_its_merchant_id
    invoice_repository = InvoiceRepository.new
    result = invoice_repository.invoices[0].object_id
    assert_equal invoice_repository.find_by_merchant_id(26).object_id, result
  end

  def test_it_will_return_nil_if_merchant_id_does_not_exist
    invoice_repository = InvoiceRepository.new
    assert_equal invoice_repository.find_by_merchant_id(100000), nil 
  end

  def test_it_can_find_a_invoice_by_created_at
    invoice_repository = InvoiceRepository.new
    result = invoice_repository.invoices[0].object_id
    assert_equal invoice_repository.find_by_created_at("2012-03-25 09:54:09 UTC").object_id, result
  end

  def test_it_can_find_a_invoice_by_created_at_case_insensitive
    invoice_repository = InvoiceRepository.new
    result = invoice_repository.invoices[0].object_id
    assert_equal invoice_repository.find_by_created_at("2012-03-25 09:54:09 utc").object_id, result
  end

  def test_it_will_return_nil_if_created_at_is_not_the_full_date_time
    invoice_repository = InvoiceRepository.new
    assert_equal invoice_repository.find_by_created_at("2012-03-25"), nil
  end

  def test_it_can_find_a_invoice_by_updated_at
    invoice_repository = InvoiceRepository.new
    result = invoice_repository.invoices[0].object_id
    assert_equal invoice_repository.find_by_updated_at("2012-03-25 09:54:09 UTC").object_id, result
  end

  def test_it_can_find_a_invoice_by_updated_at_case_insensitive
    invoice_repository = InvoiceRepository.new
    result = invoice_repository.invoices[0].object_id
    assert_equal invoice_repository.find_by_updated_at("2012-03-25 09:54:09 utc").object_id, result
  end

  def test_it_will_return_nil_if_updated_at_is_not_the_full_date_time
    invoice_repository = InvoiceRepository.new
    assert_equal invoice_repository.find_by_updated_at("2012-03-27"), nil
  end

  def test_it_can_find_all_matches_by_id
    invoice_repository = InvoiceRepository.new
    assert_equal invoice_repository.find_all_by_id(1).size, 1
  end

  def test_it_returns_a_blank_array_if_no_matches_by_id
    invoice_repository = InvoiceRepository.new
    assert_equal invoice_repository.find_all_by_id(10000), []
  end

  def test_it_can_find_all_matches_by_customer_id
    invoice_repository = InvoiceRepository.new
    assert_equal invoice_repository.find_all_by_customer_id(1).size, 8
  end

  def test_it_returns_a_blank_array_if_no_matches_by_customer_id
    invoice_repository = InvoiceRepository.new
    assert_equal invoice_repository.find_all_by_customer_id(10000), []
  end

  def test_it_can_find_all_matches_by_merchant_id
    invoice_repository = InvoiceRepository.new
    assert_equal invoice_repository.find_all_by_merchant_id(1).size, 59
  end

  def test_it_returns_a_blank_array_if_no_matches_by_merchant_id
    invoice_repository = InvoiceRepository.new
    assert_equal invoice_repository.find_all_by_merchant_id(10000), []
  end
  
  def test_it_can_find_all_matches_by_created_at
    invoice_repository = InvoiceRepository.new
    assert_equal invoice_repository.find_all_by_created_at("2012-03-06 15:56:55 UTC").size, 1
  end

  def test_it_returns_a_blank_array_if_no_matches_by_created_at
    invoice_repository = InvoiceRepository.new
    assert_equal invoice_repository.find_all_by_created_at("2010-03-27 14:54:10 UTC"), []
  end

  def test_it_can_find_all_matches_by_updated_at
    invoice_repository = InvoiceRepository.new
    assert_equal invoice_repository.find_all_by_updated_at("2012-03-06 14:54:15 UTC").size, 1
  end

  def test_it_returns_a_blank_array_if_no_matches_by_updated_at   
    invoice_repository = InvoiceRepository.new
    assert_equal invoice_repository.find_all_by_updated_at("2010-03-27 14:54:10 UTC"), []
  end

end