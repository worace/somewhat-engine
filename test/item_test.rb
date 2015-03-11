require './test/test_helper'

class ItemTest < Minitest::Test 

  def test_item_objects_have_a_repository
    item_repository = ItemRepository.new
    item_repository.create_item_objects
    result = item_repository.items[0].repository
    assert_equal item_repository, result
  end

  def test_item_objects_have_a_fixnum_for_id
    item_repository = ItemRepository.new
    item_repository.create_item_objects
    result = item_repository.items[0].id.class
    assert_equal Fixnum, result
  end

  def test_item_objects_have_a_fixnum_for_merchant_id
    item_repository = ItemRepository.new
    item_repository.create_item_objects
    result = item_repository.items[0].merchant_id.class
    assert_equal Fixnum, result
  end

  def test_item_objects_have_a_string_for_name
    item_repository = ItemRepository.new
    item_repository.create_item_objects
    result = item_repository.items[0].name.class
    assert_equal String, result
  end

  def test_item_objects_have_a_string_for_description
    item_repository = ItemRepository.new
    item_repository.create_item_objects
    result = item_repository.items[0].description.class
    assert_equal String, result
  end

  def test_item_objects_have_a_fixnum_for_unit_price
    item_repository = ItemRepository.new
    item_repository.create_item_objects
    result = item_repository.items[0].unit_price.class
    assert_equal Fixnum, result
  end

  def test_item_objects_have_a_string_for_created_at
    item_repository = ItemRepository.new
    item_repository.create_item_objects
    result = item_repository.items[0].created_at.class
    assert_equal String, result
  end

  def test_item_objects_have_a_string_for_updated_at
    item_repository = ItemRepository.new
    item_repository.create_item_objects
    result = item_repository.items[0].updated_at.class
    assert_equal String, result
  end

end
