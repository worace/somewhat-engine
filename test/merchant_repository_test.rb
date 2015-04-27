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

	def test_it_can_find_a_merchant_by_its_name
		result = @repo.merchants[4].object_id
		assert_equal @repo.find_by_name("williamson group").object_id, result
	end

	def test_it_can_find_a_merchant_by_its_name_case_insensitive
		result = @repo.merchants[4].object_id
		assert_equal @repo.find_by_name("WiLLiamSon GRouP").object_id, result
	end

	def test_it_will_return_nil_if_name_is_not_the_full_name
		assert_equal @repo.find_by_name("WiLLiamSon"), nil
	end

	def test_it_can_find_a_merchant_by_created_at
		result = @repo.merchants[0].object_id
		assert_equal @repo.find_by_created_at(Date.parse("2012-03-27 14:53:59 UTC")).object_id, result
	end

	def test_it_can_find_a_merchant_by_created_at_case_insensitive
		result = @repo.merchants[0].object_id
		assert_equal @repo.find_by_created_at(Date.parse("2012-03-27 14:53:59 utc")).object_id, result
	end

	def test_it_can_find_a_merchant_by_updated_at
		result = @repo.merchants[0].object_id
		assert_equal @repo.find_by_updated_at(Date.parse("2012-03-27 14:53:59 UTC")).object_id, result
	end

	def test_it_can_find_a_merchant_by_updated_at_case_insensitive
		result = @repo.merchants[0].object_id
		assert_equal @repo.find_by_updated_at(Date.parse("2012-03-27 14:53:59 utc")).object_id, result
	end

	def test_it_can_find_all_matches_by_id
		assert_equal @repo.find_all_by_id(2).size, 1
	end

	def test_it_returns_a_blank_array_if_no_matches_by_id
		assert_equal @repo.find_all_by_id(10000), []
	end

	def test_it_can_find_all_matches_by_name
		assert_equal @repo.find_all_by_name("Williamson Group").size, 2
	end

	def test_it_returns_a_blank_array_if_no_matches_by_name
		assert_equal @repo.find_all_by_id("Williamson"), []
	end

	def test_it_can_find_all_matches_by_created_at
		assert_equal 100, @repo.find_all_by_created_at(Date.parse("2012-03-27 14:53:59 UTC")).size
	end

	def test_it_returns_a_blank_array_if_no_matches_by_created_at
		assert_equal @repo.find_all_by_created_at(Date.parse("2010-03-27 14:53:59 UTC")), []
	end

	def test_it_can_find_all_matches_by_updated_at
		assert_equal 100, @repo.find_all_by_updated_at(Date.parse("2012-03-27 14:53:59 UTC")).size
	end

	def test_it_returns_a_blank_array_if_no_matches_by_updated_at
		assert_equal @repo.find_all_by_updated_at(Date.parse("2010-03-27 14:53:59 UTC")), []
	end
end