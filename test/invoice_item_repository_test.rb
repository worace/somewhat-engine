require_relative './test_helper'

class InvoiceItemRepositoryTest < Minitest::Spec

  @@flag = nil
  before do
    unless @@flag
      @@engine = SalesEngine.new("./data")
      @@engine.startup
      @@flag = true
    end
    @invoice_item_repository = @@engine.invoice_item_repository
  end 

  def test_it_has_a_sales_engine
    assert_equal SalesEngine, @invoice_item_repository.parent_engine.class
  end

  def test_it_creates_an_array_of_item_objects_from_csv
    result = @invoice_item_repository.invoice_items[0].class
    assert_equal InvoiceItem, result
  end

  def test_item_can_return_all_the_item_objects
    result = @invoice_item_repository.invoice_items.size
    assert_equal @invoice_item_repository.all.size, result
  end

  def test_item_can_return_a_random_item_object
    result = @invoice_item_repository.random.class
    assert_equal InvoiceItem, result
  end

  def test_it_can_find_a_item_by_its_id
    result = @invoice_item_repository.invoice_items[0].object_id
    assert_equal @invoice_item_repository.find_by_id(1).object_id, result
  end

  def test_it_can_find_a_item_by_item_id
    result = @invoice_item_repository.invoice_items[0]
    assert_equal @invoice_item_repository.find_by_item_id(result.item_id), result
  end

  def test_it_will_return_nil_if_id_does_not_exist
    assert_equal @invoice_item_repository.find_by_id(100000), nil
  end

  def test_it_can_find_a_item_by_invoice_id
    result = @invoice_item_repository.invoice_items[0].object_id
    assert_equal @invoice_item_repository.find_by_invoice_id(1).object_id, result
  end

  def test_it_can_find_all_matches_by_id
    assert_equal 1, @invoice_item_repository.find_all_by_id(1).size
  end

  def test_it_returns_a_blank_array_if_no_matches_by_id
    assert_equal @invoice_item_repository.find_all_by_id(100000), []
  end

  def test_it_can_find_all_items_by_invoice_id
    assert_equal 8, @invoice_item_repository.find_all_by_invoice_id(1).size
  end
end