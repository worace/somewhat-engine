require_relative './test_helper'

class MerchantRepositoryTest < Minitest::Spec

  @@flag = nil
  before do
    unless @@flag
      @@engine = SalesEngine.new("./data")
      @@engine.startup
      @@flag = true
    end
    @repo = @@engine.merchant_repository
  end

  def test_it_creates_an_array_of_objects
    result = @repo.merchants.class
    assert_equal Array, result
  end

  def test_it_creates_an_array_of_merchant_objects_from_csv
    result = @repo.merchants[0].class
    assert_equal Merchant, result
  end

  def test_merchant_objects_reflect_repo_as_their_repository
    result = @repo.merchants[0].repository.class
    assert_equal MerchantRepository, result
    result = @repo.merchants[0].repository
    assert_equal @repo, result
  end

  def test_merchant_can_return_all_the_merchant_objects
    result = @repo.merchants.size
    assert_equal @repo.all.size, result
  end

  def test_merchant_can_return_a_random_merchant_object
    result = @repo.random.class
    assert_equal Merchant, result
  end

  def test_it_can_find_a_merchant_by_its_id
    result = @repo.merchants[4].object_id
    assert_equal @repo.find_by_id(5).object_id, result
  end

  def test_it_will_return_nil_if_id_does_not_exist
    assert_equal @repo.find_by_id(1000), nil 
  end

end