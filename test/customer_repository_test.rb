require_relative './test_helper'

class CustomerRepositoryTest < Minitest::Spec

  @@flag = nil
  before do
    unless @@flag
      @@engine = SalesEngine.new("./data")
      @@engine.startup
      @@flag = true
    end
    @customer_repository = @@engine.customer_repository
  end

  def test_it_creates_an_array_of_customer_objects_from_csv
    result = @customer_repository.customers[0].class
    assert_equal Customer, result
  end

  def test_customer_repository_has_a_sales_engine
    assert_equal SalesEngine, @customer_repository.parent_engine.class
  end

  def test_customer_can_return_all_the_customer_objects
    result = @customer_repository.customers.size
    assert_equal @customer_repository.all.size, result
  end

  def test_customer_can_return_a_random_customer_object
    result = @customer_repository.random.class
    assert_equal Customer, result
  end

  def test_it_can_find_a_customer_by_its_id
    result = @customer_repository.customers[4].object_id
    assert_equal @customer_repository.find_by_id(5).object_id, result
  end

  def test_it_will_return_nil_if_id_does_not_exist
    assert_equal @customer_repository.find_by_id(10000), nil 
  end

  def test_it_can_find_a_customer_by_first_name
    result = @customer_repository.customers[0].object_id
    assert_equal @customer_repository.find_by_first_name("Joey").object_id, result
  end

  def test_it_can_find_a_customer_by_last_name
    result = @customer_repository.customers[0].object_id
    assert_equal @customer_repository.find_by_last_name("Ondricka").object_id, result
  end

  def test_it_can_find_a_customer_by_its_first_name_case_insensitive
    result = @customer_repository.customers[0].object_id
    assert_equal @customer_repository.find_by_last_name("oNdRiCka").object_id, result
  end

  def test_it_will_return_nil_if_name_is_not_the_full_name
    assert_equal @customer_repository.find_by_last_name("Ondr"), nil
  end

  def test_it_can_find_a_customer_by_created_at
    result = @customer_repository.customers[0].object_id
    assert_equal @customer_repository.find_by_created_at(Date.parse("2012-03-27 14:54:09 UTC")).object_id, result
  end

  def test_it_can_find_a_customer_by_created_at_case_insensitive
    result = @customer_repository.customers[0].object_id
    assert_equal @customer_repository.find_by_created_at(Date.parse("2012-03-27 14:54:09 utc")).object_id, result
  end

  def test_it_can_find_a_customer_by_updated_at
    result = @customer_repository.customers[0].object_id
    assert_equal @customer_repository.find_by_updated_at(Date.parse("2012-03-27 14:54:09 UTC")).object_id, result
  end

  def test_it_can_find_a_customer_by_updated_at_case_insensitive
    result = @customer_repository.customers[0].object_id
    assert_equal @customer_repository.find_by_updated_at(Date.parse("2012-03-27 14:54:09 utc")).object_id, result
  end

  def test_it_can_find_all_matches_by_id
    assert_equal @customer_repository.find_all_by_id(1).size, 1
  end

  def test_it_returns_a_blank_array_if_no_matches_by_id
    assert_equal @customer_repository.find_all_by_id(10000), []
  end

  def test_it_can_find_all_matches_by_first_name
    assert_equal @customer_repository.find_all_by_first_name("Abbey").size, 2
  end

  def test_it_returns_a_blank_array_if_no_matches_by_first_name
    assert_equal @customer_repository.find_all_by_first_name("Yo Yo Ma"), []
  end

  def test_it_can_find_all_matches_by_last_name
    assert_equal @customer_repository.find_all_by_last_name("AbboTT").size, 4
  end

  def test_it_returns_a_blank_array_if_no_matches_by_last_name
    assert_equal @customer_repository.find_all_by_last_name("Dinosaurus"), []
  end

  def test_it_can_find_all_matches_by_created_at
    assert_equal 1000, @customer_repository.find_all_by_created_at(Date.parse("2012-03-27 14:54:10 UTC")).size
  end

  def test_it_returns_a_blank_array_if_no_matches_by_created_at
    assert_equal @customer_repository.find_all_by_created_at(Date.parse("2010-03-27 14:54:10 UTC")), []
  end

  def test_it_can_find_all_matches_by_updated_at
    assert_equal 1000, @customer_repository.find_all_by_updated_at(Date.parse("2012-03-27 14:54:10 UTC")).size
  end

  def test_it_returns_a_blank_array_if_no_matches_by_updated_at
    assert_equal @customer_repository.find_all_by_updated_at(Date.parse("2010-03-27 14:54:10 UTC")), []
  end

end