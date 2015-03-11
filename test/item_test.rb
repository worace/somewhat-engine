require_relative './test_helper'

class ItemTest < Minitest::Spec

  @@flag = nil
  before do
    unless @@flag
      @@engine = SalesEngine.new("./data")
      @@engine.startup
      @@flag = true
    end
    @item = @@engine.item_repository.find_by_id(1000)
  end 

  def test_item_objects_have_an_item_repository
    assert_equal ItemRepository, @item.repository.class 
  end

  def test_item_objects_have_a_fixnum_for_id
    assert_equal Fixnum, @item.id.class 
  end

  def test_item_objects_have_a_fixnum_for_merchant_id
    assert_equal Fixnum, @item.merchant_id.class 
  end

  def test_item_objects_have_a_string_for_name
    assert_equal String, @item.name.class 
  end

  def test_item_objects_have_a_string_for_description
    assert_equal String, @item.description.class 
  end

  def test_item_objects_have_a_BigDecimal_for_unit_price
    assert_equal BigDecimal, @item.unit_price.class 
  end

  def test_item_objects_have_a_date_for_created_at
    assert_equal Date, @item.created_at.class 
  end

  def test_item_objects_have_a_date_for_updated_at
    assert_equal Date, @item.updated_at.class 
  end

  def test_item_can_find_its_merchant
    result = @item.merchant
    assert_equal result.id, @item.merchant_id
  end

  def test_item_can_return_its_invoice_items
    result = @item.invoice_items
    assert_equal Array, result.class
    assert_equal InvoiceItem, result[0].class
  end

  def test_it_can_calculate_its_best_day
    result = @item.best_day
    assert_equal Date.parse("2012-03-27"), result
  end

  def test_it_can_find_total_items_sold
    result = @item.items_sold 
    assert_equal 27, result
  end

  def test_it_can_find_total_revenue
    result = @item.items_revenue
    assert_equal BigDecimal.new("8853.57"), result
  end

end
