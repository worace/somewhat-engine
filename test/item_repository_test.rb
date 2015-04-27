require_relative './test_helper'

class ItemRepositoryTest < Minitest::Spec

  @@flag = nil
  before do
    unless @@flag
      @@engine = SalesEngine.new("./data")
      @@engine.startup
      @@flag = true
    end
    @item_repository = @@engine.item_repository
  end 

  def test_it_creates_an_array_of_objects
    result = @item_repository.items.class
    assert_equal Array, result
  end

  def test_it_creates_an_array_of_item_objects_from_csv
    result = @item_repository.items[0].class
    assert_equal Item, result
  end

  def test_the_item_repository_has_a_sales_engine
    assert_equal SalesEngine, @item_repository.parent_engine.class 
  end

  def test_item_can_return_all_the_item_objects
    result = @item_repository.items.size
    assert_equal @item_repository.all.size, result
  end

  def test_item_can_return_a_random_item_object
    result = @item_repository.random.class
    assert_equal Item, result
  end

  def test_it_can_find_a_item_by_its_id
    result = @item_repository.items[0].object_id
    assert_equal @item_repository.find_by_id(1).object_id, result
  end

  def test_it_will_return_nil_if_id_does_not_exist
    assert_equal @item_repository.find_by_id(10000), nil 
  end

  def test_it_can_find_all_matches_by_id
    assert_equal @item_repository.find_all_by_id(1).size, 1
  end

  def test_it_returns_a_blank_array_if_no_matches_by_id
    assert_equal @item_repository.find_all_by_id(10000), []
  end

end