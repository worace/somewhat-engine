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

  def test_it_can_find_a_item_by_name
    result = @item_repository.items[0].object_id
    assert_equal @item_repository.find_by_name("Item Qui Esse").object_id, result
  end

  def test_it_can_find_a_item_by_name_case_insensitive
    result = @item_repository.items[0].object_id
    assert_equal @item_repository.find_by_name("IteM QUI essE").object_id, result
  end

  def test_it_will_return_nil_if_name_is_not_the_full_name
    assert_equal @item_repository.find_by_name("IteM QU"), nil
  end

  def test_it_can_find_a_item_by_description
    description = "Nostrum doloribus quia. Expedita vitae beatae cumque. Aut ut illo aut eum."
    result = @item_repository.items[12].object_id
    assert_equal @item_repository.find_by_description(description).object_id, result
  end

  def test_it_can_find_a_item_by_description_case_insensitive
    description = "NOSTRUM doLOribus quiA. ExpeDItA vitae beatae cumQue. AUT uT illO aut eum."
    result = @item_repository.items[12].object_id
    assert_equal @item_repository.find_by_description(description).object_id, result
  end

  def test_it_will_return_nil_if_description_is_not_the_full_description
    description = "Nostrum doloribus quia."
    assert_equal @item_repository.find_by_description(description), nil
  end

  def test_it_can_find_a_item_by_unit_price
    result = @item_repository.items[0].object_id
    assert_equal result, @item_repository.find_by_unit_price(BigDecimal.new("751.07")).object_id
  end

  def test_it_returns_nil_if_there_is_no_matching_unit_price
    assert_equal @item_repository.find_by_unit_price(15), nil
  end

  def test_it_can_find_a_item_by_its_merchant_id
    result = @item_repository.items[0].object_id
    assert_equal @item_repository.find_by_merchant_id(1).object_id, result
  end

  def test_it_will_return_nil_if_merchant_id_does_not_exist
    assert_equal @item_repository.find_by_merchant_id(10000), nil 
  end

  def test_it_can_find_a_item_by_created_at
    result = @item_repository.items[0].object_id
    assert_equal @item_repository.find_by_created_at(Date.parse("2012-03-27 14:53:59 UTC")).object_id, result
  end

  def test_it_can_find_a_item_by_updated_at
    result = @item_repository.items[0].object_id
    assert_equal @item_repository.find_by_updated_at(Date.parse("2012-03-27 14:53:59 UTC")).object_id, result
  end

  def test_it_can_find_all_matches_by_id
    assert_equal @item_repository.find_all_by_id(1).size, 1
  end

  def test_it_returns_a_blank_array_if_no_matches_by_id
    assert_equal @item_repository.find_all_by_id(10000), []
  end

  def test_it_can_find_all_matches_by_name
    assert_equal @item_repository.find_all_by_name("Item Qui Esse").size, 1
  end

  def test_it_returns_a_blank_array_if_no_matches_by_name
    assert_equal @item_repository.find_all_by_name("Awesome Powder"), []
  end

  def test_it_can_find_all_matches_by_description
    description = "Nostrum doloribus quia. Expedita vitae beatae cumque. Aut ut illo aut eum."
    assert_equal @item_repository.find_all_by_description(description).size, 1
  end

  def test_it_returns_a_blank_array_if_no_matches_by_description
    assert_equal @item_repository.find_all_by_description("This is Awesome Powder"), []
  end

  def test_it_can_find_all_items_by_unit_price
    result = @item_repository.items[0].object_id
    assert_equal 2, @item_repository.find_all_by_unit_price(BigDecimal.new("751.07")).size
  end

  def test_it_returns_blank_array_if_there_is_no_matching_unit_price
    assert_equal @item_repository.find_all_by_unit_price(15), []
  end

  def test_it_can_find_all_matches_by_merchant_id
    assert_equal @item_repository.find_all_by_merchant_id(1).size, 15
  end

  def test_it_returns_a_blank_array_if_no_matches_by_merchant_id
    assert_equal @item_repository.find_all_by_merchant_id(10000), []
  end

  def test_it_can_find_all_matches_by_created_at
    assert_equal 2483, @item_repository.find_all_by_created_at(Date.parse("2012-03-27 14:53:59 UTC")).size
  end

  def test_it_returns_a_blank_array_if_no_matches_by_created_at
    assert_equal @item_repository.find_all_by_created_at(Date.parse("2010-03-27 14:54:10 UTC")), []
  end

  def test_it_can_find_all_matches_by_updated_at
    assert_equal 2483, @item_repository.find_all_by_updated_at(Date.parse("2012-03-27 14:53:59 UTC")).size
  end

  def test_it_returns_a_blank_array_if_no_matches_by_updated_at
    assert_equal @item_repository.find_all_by_updated_at(Date.parse("2010-03-27 14:54:10 UTC")), []
  end

  def test_it_can_return_top_x_items
    result = @item_repository.most_items(5)
    assert_equal 5, result.size
    assert_equal "Item Delectus Saepe", result[2].name 
  end

  def test_it_can_return_top_x_items_by_revenue
    result = @item_repository.most_revenue(5)
    assert_equal 5, result.size
    assert_equal "Item Aut Vero", result[2].name
  end

end