require_relative './test_helper'

class InvoiceItemsTest < Minitest::Spec

  @@flag = nil
  before do
    unless @@flag
      @@engine = SalesEngine.new("./data")
      @@engine.startup
      @@flag = true
    end
    @item = @@engine.invoice_item_repository.find_by_id(10029)
  end

  def test_invoice_item_has_an_id
    assert_equal Fixnum, @item.id.class
  end

  def test_invoice_item_has_an_invoice_item_repository
    assert_equal InvoiceItemRepository, @item.repository.class
  end

  def test_invoice_item_has_an_item_id
    assert_equal Fixnum, @item.item_id.class
  end

  def test_invoice_item_has_an_invoice_id
    assert_equal Fixnum, @item.invoice_id.class
  end

  def test_invoice_item_has_a_quantity
    assert_equal Fixnum, @item.quantity.class
  end

  def test_invoice_item_has_a_unit_price
    assert_equal BigDecimal, @item.unit_price.class
  end

  def test_invoice_item_has_a_created_date
    assert_equal Date, @item.created_at.class
  end

  def test_invoice_item_has_an_updated_date
    assert_equal Date, @item.updated_at.class
  end

  def test_invoice_method_can_find_invoice_of_invoice_itme
    result = @item.invoice
    assert_equal @item.invoice_id, result.id
  end

end
