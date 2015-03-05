require './test/test_helper'

class CustomerRepositoryTest < Minitest::Test 

	def test_the_customer_array_starts_empty
		skip
		customer_repository = CustomerRepository.new
		result = customer_repository.customers
		assert_equal result, []
	end

	def test_it_creates_an_array_of_objects
		customer_repository = CustomerRepository.new
		customer_repository.create_customer_objects
		result = customer_repository.customers.class
		assert_equal Array, result
	end

	def test_it_creates_an_array_of_customer_objects_from_csv
		customer_repository = CustomerRepository.new
		customer_repository.create_customer_objects
		result = customer_repository.customers[0].class
		assert_equal Customer, result
	end

	def test_customer_objects_reflect_customer_repository_as_their_repository
		customer_repository = CustomerRepository.new
		customer_repository.create_customer_objects
		result = customer_repository.customers[0].repository.class
		assert_equal CustomerRepository, result
		result = customer_repository.customers[0].repository
		assert_equal customer_repository, result
	end

	def test_customer_can_return_all_the_customer_objects
		customer_repository = CustomerRepository.new
		result = customer_repository.customers.size
		assert_equal customer_repository.all.size, result
	end

	def test_customer_can_return_a_random_customer_object
		customer_repository = CustomerRepository.new
		result = customer_repository.random.class
		assert_equal Customer, result
	end

	def test_it_can_find_a_customer_by_its_id
		customer_repository = CustomerRepository.new
		result = customer_repository.customers[4].object_id
		assert_equal customer_repository.find_by_id(5).object_id, result
	end

	def test_it_will_return_nil_if_id_does_not_exist
		customer_repository = CustomerRepository.new
		assert_equal customer_repository.find_by_id(10000), nil 
	end

	def test_it_can_find_a_customer_by_first_name
		customer_repository = CustomerRepository.new
		result = customer_repository.customers[0].object_id
		assert_equal customer_repository.find_by_first_name("Joey").object_id, result
	end

	def test_it_can_find_a_customer_by_its_first_name_case_insensitive
		customer_repository = CustomerRepository.new
		result = customer_repository.customers[0].object_id
		assert_equal customer_repository.find_by_first_name("joEY").object_id, result
	end

	def test_it_will_return_nil_if_name_is_not_the_full_name
		customer_repository = CustomerRepository.new
		assert_equal customer_repository.find_by_first_name("Yo Yo Ma"), nil
	end

	def test_it_can_find_a_customer_by_last_name
		customer_repository = CustomerRepository.new
		result = customer_repository.customers[0].object_id
		assert_equal customer_repository.find_by_last_name("Ondricka").object_id, result
	end

	def test_it_can_find_a_customer_by_its_first_name_case_insensitive
		customer_repository = CustomerRepository.new
		result = customer_repository.customers[0].object_id
		assert_equal customer_repository.find_by_last_name("oNdRiCka").object_id, result
	end

	def test_it_will_return_nil_if_name_is_not_the_full_name
		customer_repository = CustomerRepository.new
		assert_equal customer_repository.find_by_last_name("Ondr"), nil
	end

	def test_it_can_find_a_customer_by_created_at
		customer_repository = CustomerRepository.new
		result = customer_repository.customers[0].object_id
		assert_equal customer_repository.find_by_created_at("2012-03-27 14:54:09 UTC").object_id, result
	end

	def test_it_can_find_a_customer_by_created_at_case_insensitive
		customer_repository = CustomerRepository.new
		result = customer_repository.customers[0].object_id
		assert_equal customer_repository.find_by_created_at("2012-03-27 14:54:09 utc").object_id, result
	end

	def test_it_will_return_nil_if_created_at_is_not_the_full_date_time
		customer_repository = CustomerRepository.new
		assert_equal customer_repository.find_by_created_at("2012-03-27"), nil
	end

	def test_it_can_find_a_customer_by_updated_at
		customer_repository = CustomerRepository.new
		result = customer_repository.customers[0].object_id
		assert_equal customer_repository.find_by_updated_at("2012-03-27 14:54:09 UTC").object_id, result
	end

	def test_it_can_find_a_customer_by_updated_at_case_insensitive
		customer_repository = CustomerRepository.new
		result = customer_repository.customers[0].object_id
		assert_equal customer_repository.find_by_updated_at("2012-03-27 14:54:09 utc").object_id, result
	end

	def test_it_will_return_nil_if_updated_at_is_not_the_full_date_time
		customer_repository = CustomerRepository.new
		assert_equal customer_repository.find_by_updated_at("2012-03-27"), nil
	end

	def test_it_can_find_all_matches_by_id
		customer_repository = CustomerRepository.new
		assert_equal customer_repository.find_all_by_id(1).size, 1
	end

	def test_it_returns_a_blank_array_if_no_matches_by_id
		customer_repository = CustomerRepository.new
		assert_equal customer_repository.find_all_by_id(10000), []
	end

	def test_it_can_find_all_matches_by_first_name
		customer_repository = CustomerRepository.new
		assert_equal customer_repository.find_all_by_first_name("Abbey").size, 2
	end

	def test_it_returns_a_blank_array_if_no_matches_by_first_name
		customer_repository = CustomerRepository.new
		assert_equal customer_repository.find_all_by_first_name("Yo Yo Ma"), []
	end

	def test_it_can_find_all_matches_by_last_name
		customer_repository = CustomerRepository.new
		assert_equal customer_repository.find_all_by_last_name("AbboTT").size, 4
	end

	def test_it_returns_a_blank_array_if_no_matches_by_last_name
		customer_repository = CustomerRepository.new
		assert_equal customer_repository.find_all_by_last_name("Dinosaurus"), []
	end

	def test_it_can_find_all_matches_by_created_at
		customer_repository = CustomerRepository.new
		assert_equal customer_repository.find_all_by_created_at("2012-03-27 14:54:10 UTC").size, 6
	end

	def test_it_returns_a_blank_array_if_no_matches_by_created_at
		customer_repository = CustomerRepository.new
		assert_equal customer_repository.find_all_by_created_at("2010-03-27 14:54:10 UTC"), []
	end

	def test_it_can_find_all_matches_by_updated_at
		customer_repository = CustomerRepository.new
		assert_equal customer_repository.find_all_by_updated_at("2012-03-27 14:54:10 UTC").size, 6
	end

	def test_it_returns_a_blank_array_if_no_matches_by_updated_at
		customer_repository = CustomerRepository.new
		assert_equal customer_repository.find_all_by_updated_at("2010-03-27 14:54:10 UTC"), []
	end

end