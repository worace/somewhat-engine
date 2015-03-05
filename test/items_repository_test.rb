require './test/test_helper'

class ItemRepositoryTest < Minitest::Test 

  def test_the_item_array_starts_empty
    skip
    item_repository = ItemRepository.new
    result = item_repository.items
    assert_equal result, []
  end

  def test_it_creates_an_array_of_objects
    item_repository = ItemRepository.new
    item_repository.create_item_objects
    result = item_repository.items.class
    assert_equal Array, result
  end

  def test_it_creates_an_array_of_item_objects_from_csv
    item_repository = ItemRepository.new
    item_repository.create_item_objects
    result = item_repository.items[0].class
    assert_equal Item, result
  end

  def test_item_objects_reflect_item_repository_as_their_repository
    item_repository = ItemRepository.new
    item_repository.create_item_objects
    result = item_repository.items[0].repository.class
    assert_equal ItemRepository, result
    result = item_repository.items[0].repository
    assert_equal item_repository, result
  end

  def test_item_can_return_all_the_item_objects
    item_repository = ItemRepository.new
    result = item_repository.items.size
    assert_equal item_repository.all.size, result
  end

  def test_item_can_return_a_random_item_object
    item_repository = ItemRepository.new
    result = item_repository.random.class
    assert_equal Item, result
  end

  def test_it_can_find_a_item_by_its_id
    item_repository = ItemRepository.new
    result = item_repository.items[0].object_id
    assert_equal item_repository.find_by_id(1).object_id, result
  end

  def test_it_will_return_nil_if_id_does_not_exist
    item_repository = ItemRepository.new
    assert_equal item_repository.find_by_id(10000), nil 
  end

  def test_it_can_find_a_item_by_name
    item_repository = ItemRepository.new
    result = item_repository.items[0].object_id
    assert_equal item_repository.find_by_name("Item Qui Esse").object_id, result
  end

  def test_it_can_find_a_item_by_name_case_insensitive
    item_repository = ItemRepository.new
    result = item_repository.items[0].object_id
    assert_equal item_repository.find_by_name("IteM QUI essE").object_id, result
  end

  def test_it_will_return_nil_if_name_is_not_the_full_name
    item_repository = ItemRepository.new
    assert_equal item_repository.find_by_name("IteM QU"), nil
  end

  def test_it_can_find_a_item_by_description
    item_repository = ItemRepository.new
    description = "Nostrum doloribus quia. Expedita vitae beatae cumque. Aut ut illo aut eum."
    result = item_repository.items[12].object_id
    assert_equal item_repository.find_by_description(description).object_id, result
  end

  def test_it_can_find_a_item_by_description_case_insensitive
    item_repository = ItemRepository.new
    description = "NOSTRUM doLOribus quiA. ExpeDItA vitae beatae cumQue. AUT uT illO aut eum."
    result = item_repository.items[12].object_id
    assert_equal item_repository.find_by_description(description).object_id, result
  end

  def test_it_will_return_nil_if_description_is_not_the_full_description
    item_repository = ItemRepository.new
    description = "Nostrum doloribus quia."
    assert_equal item_repository.find_by_description(description), nil
  end

  def test_it_can_find_a_item_by_unit_price
    item_repository = ItemRepository.new
    result = item_repository.items[0].object_id
    assert_equal item_repository.find_by_unit_price(75107).object_id, result
  end

  def test_it_returns_nil_if_there_is_no_matching_unit_price
    item_repository = ItemRepository.new
    assert_equal item_repository.find_by_unit_price(15), nil
  end

  def test_it_can_find_a_item_by_its_merchant_id
    item_repository = ItemRepository.new
    result = item_repository.items[0].object_id
    assert_equal item_repository.find_by_merchant_id(1).object_id, result
  end

  def test_it_will_return_nil_if_merchant_id_does_not_exist
    item_repository = ItemRepository.new
    assert_equal item_repository.find_by_merchant_id(10000), nil 
  end

  def test_it_can_find_a_item_by_created_at
    item_repository = ItemRepository.new
    result = item_repository.items[0].object_id
    assert_equal item_repository.find_by_created_at("2012-03-27 14:53:59 UTC").object_id, result
  end

  def test_it_can_find_a_item_by_created_at_case_insensitive
    item_repository = ItemRepository.new
    result = item_repository.items[0].object_id
    assert_equal item_repository.find_by_created_at("2012-03-27 14:53:59 utc").object_id, result
  end

  def test_it_will_return_nil_if_created_at_is_not_the_full_date_time
    item_repository = ItemRepository.new
    assert_equal item_repository.find_by_created_at("2012-03-27"), nil
  end

  def test_it_can_find_a_item_by_updated_at
    item_repository = ItemRepository.new
    result = item_repository.items[0].object_id
    assert_equal item_repository.find_by_updated_at("2012-03-27 14:53:59 UTC").object_id, result
  end

  def test_it_can_find_a_item_by_updated_at_case_insensitive
    item_repository = ItemRepository.new
    result = item_repository.items[0].object_id
    assert_equal item_repository.find_by_updated_at("2012-03-27 14:53:59 utc").object_id, result
  end

  def test_it_will_return_nil_if_updated_at_is_not_the_full_date_time
    item_repository = ItemRepository.new
    assert_equal item_repository.find_by_updated_at("2012-03-27"), nil
  end

  def test_it_can_find_all_matches_by_id
    item_repository = ItemRepository.new
    assert_equal item_repository.find_all_by_id(1).size, 1
  end

  def test_it_returns_a_blank_array_if_no_matches_by_id
    item_repository = ItemRepository.new
    assert_equal item_repository.find_all_by_id(10000), []
  end

  def test_it_can_find_all_matches_by_name
    item_repository = ItemRepository.new
    assert_equal item_repository.find_all_by_name("Item Qui Esse").size, 1
  end

  def test_it_returns_a_blank_array_if_no_matches_by_name
    item_repository = ItemRepository.new
    assert_equal item_repository.find_all_by_name("Awesome Powder"), []
  end

  def test_it_can_find_all_matches_by_description
    item_repository = ItemRepository.new
    description = "Nostrum doloribus quia. Expedita vitae beatae cumque. Aut ut illo aut eum."
    assert_equal item_repository.find_all_by_description(description).size, 1
  end

  def test_it_returns_a_blank_array_if_no_matches_by_description
    item_repository = ItemRepository.new
    assert_equal item_repository.find_all_by_description("This is Awesome Powder"), []
  end

  def test_it_can_find_all_items_by_unit_price
    item_repository = ItemRepository.new
    result = item_repository.items[0].object_id
    assert_equal item_repository.find_all_by_unit_price(75107).size, 2
  end

  def test_it_returns_blank_array_if_there_is_no_matching_unit_price
    item_repository = ItemRepository.new
    assert_equal item_repository.find_all_by_unit_price(15), []
  end

  def test_it_can_find_all_matches_by_merchant_id
    item_repository = ItemRepository.new
    assert_equal item_repository.find_all_by_merchant_id(1).size, 15
  end

  def test_it_returns_a_blank_array_if_no_matches_by_merchant_id
    item_repository = ItemRepository.new
    assert_equal item_repository.find_all_by_merchant_id(10000), []
  end

  def test_it_can_find_all_matches_by_created_at
    item_repository = ItemRepository.new
    assert_equal item_repository.find_all_by_created_at("2012-03-27 14:53:59 UTC").size, 170
  end

  def test_it_returns_a_blank_array_if_no_matches_by_created_at
    item_repository = ItemRepository.new
    assert_equal item_repository.find_all_by_created_at("2010-03-27 14:54:10 UTC"), []
  end

  def test_it_can_find_all_matches_by_updated_at
    item_repository = ItemRepository.new
    assert_equal item_repository.find_all_by_updated_at("2012-03-27 14:53:59 UTC").size, 170
  end

  def test_it_returns_a_blank_array_if_no_matches_by_updated_at
    item_repository = ItemRepository.new
    assert_equal item_repository.find_all_by_updated_at("2010-03-27 14:54:10 UTC"), []
  end

end