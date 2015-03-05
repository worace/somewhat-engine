require './test/test_helper'

class MerchantRepositoryTest < Minitest::Test 

	def test_the_merchant_array_starts_empty
		skip
		merchant_repository = MerchantRepository.new
		result = merchant_repository.merchants
		assert_equal result, []
	end

	def test_it_creates_an_array_of_objects
		merchant_repository = MerchantRepository.new
		result = merchant_repository.merchants.class
		assert_equal Array, result
	end

	def test_it_creates_an_array_of_merchant_objects_from_csv
		merchant_repository = MerchantRepository.new
		result = merchant_repository.merchants[0].class
		assert_equal Merchant, result
	end

	def test_merchant_objects_reflect_merchant_repository_as_their_repository
		merchant_repository = MerchantRepository.new
		result = merchant_repository.merchants[0].repository.class
		assert_equal MerchantRepository, result
		result = merchant_repository.merchants[0].repository
		assert_equal merchant_repository, result
	end

	def test_merchant_can_return_all_the_merchant_objects
		merchant_repository = MerchantRepository.new
		result = merchant_repository.merchants.size
		assert_equal merchant_repository.all.size, result
	end

	def test_merchant_can_return_a_random_merchant_object
		merchant_repository = MerchantRepository.new
		result = merchant_repository.random.class
		assert_equal Merchant, result
	end

	def test_it_can_find_a_merchant_by_its_id
		merchant_repository = MerchantRepository.new
		result = merchant_repository.merchants[4].object_id
		assert_equal merchant_repository.find_by_id(5).object_id, result
	end

	def test_it_will_return_nil_if_id_does_not_exist
		merchant_repository = MerchantRepository.new
		assert_equal merchant_repository.find_by_id(1000), nil 
	end

	def test_it_can_find_a_merchant_by_its_name
		merchant_repository = MerchantRepository.new
		result = merchant_repository.merchants[4].object_id
		assert_equal merchant_repository.find_by_name("williamson group").object_id, result
	end

	def test_it_can_find_a_merchant_by_its_name_case_insensitive
		merchant_repository = MerchantRepository.new
		result = merchant_repository.merchants[4].object_id
		assert_equal merchant_repository.find_by_name("WiLLiamSon GRouP").object_id, result
	end

	def test_it_will_return_nil_if_name_is_not_the_full_name
		merchant_repository = MerchantRepository.new
		assert_equal merchant_repository.find_by_name("WiLLiamSon"), nil
	end

	def test_it_can_find_a_merchant_by_created_at
		merchant_repository = MerchantRepository.new
		result = merchant_repository.merchants[0].object_id
		assert_equal merchant_repository.find_by_created_at("2012-03-27 14:53:59 UTC").object_id, result
	end

	def test_it_can_find_a_merchant_by_created_at_case_insensitive
		merchant_repository = MerchantRepository.new
		result = merchant_repository.merchants[0].object_id
		assert_equal merchant_repository.find_by_created_at("2012-03-27 14:53:59 utc").object_id, result
	end

	def test_it_will_return_nil_if_created_at_is_not_the_full_date_time
		merchant_repository = MerchantRepository.new
		assert_equal merchant_repository.find_by_created_at("2012-03-27"), nil
	end

	def test_it_can_find_a_merchant_by_updated_at
		merchant_repository = MerchantRepository.new
		result = merchant_repository.merchants[0].object_id
		assert_equal merchant_repository.find_by_updated_at("2012-03-27 14:53:59 UTC").object_id, result
	end

	def test_it_can_find_a_merchant_by_updated_at_case_insensitive
		merchant_repository = MerchantRepository.new
		result = merchant_repository.merchants[0].object_id
		assert_equal merchant_repository.find_by_updated_at("2012-03-27 14:53:59 utc").object_id, result
	end

	def test_it_will_return_nil_if_updated_at_is_not_the_full_date_time
		merchant_repository = MerchantRepository.new
		assert_equal merchant_repository.find_by_updated_at("2012-03-27"), nil
	end

	def test_it_can_find_all_matches_by_id
		merchant_repository = MerchantRepository.new
		assert_equal merchant_repository.find_all_by_id(2).size, 1
	end

	def test_it_returns_a_blank_array_if_no_matches_by_id
		merchant_repository = MerchantRepository.new
		assert_equal merchant_repository.find_all_by_id(10000), []
	end

	def test_it_can_find_all_matches_by_name
		merchant_repository = MerchantRepository.new
		assert_equal merchant_repository.find_all_by_name("Williamson Group").size, 2
	end

	def test_it_returns_a_blank_array_if_no_matches_by_name
		merchant_repository = MerchantRepository.new
		assert_equal merchant_repository.find_all_by_id("Williamson"), []
	end

	def test_it_can_find_all_matches_by_created_at
		merchant_repository = MerchantRepository.new
		assert_equal merchant_repository.find_all_by_created_at("2012-03-27 14:53:59 UTC").size, 9
	end

	def test_it_returns_a_blank_array_if_no_matches_by_created_at
		merchant_repository = MerchantRepository.new
		assert_equal merchant_repository.find_all_by_created_at("2010-03-27 14:53:59 UTC"), []
	end

	def test_it_can_find_all_matches_by_updated_at
		merchant_repository = MerchantRepository.new
		assert_equal merchant_repository.find_all_by_updated_at("2012-03-27 14:53:59 UTC").size, 8
	end

	def test_it_returns_a_blank_array_if_no_matches_by_updated_at
		merchant_repository = MerchantRepository.new
		assert_equal merchant_repository.find_all_by_updated_at("2010-03-27 14:53:59 UTC"), []
	end

end