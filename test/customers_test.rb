require './test/test_helper'

class CustomerTest < Minitest::Test 

	def test_customer_objects_have_a_repository
		customer_repository = CustomerRepository.new
		customer_repository.create_customer_objects
		result = customer_repository.customers[0].repository
		assert_equal customer_repository, result
	end

	def test_customer_objects_have_a_fixnum_for_id
		customer_repository = CustomerRepository.new
		customer_repository.create_customer_objects
		result = customer_repository.customers[0].id.class
		assert_equal Fixnum, result
	end

	def test_customer_objects_have_a_string_for_first_name
		customer_repository = CustomerRepository.new
		customer_repository.create_customer_objects
		result = customer_repository.customers[0].first_name.class
		assert_equal String, result
	end

	def test_customer_objects_have_a_string_for_last_name
		customer_repository = CustomerRepository.new
		customer_repository.create_customer_objects
		result = customer_repository.customers[0].last_name.class
		assert_equal String, result
	end

	def test_customer_objects_have_a_string_for_created_at
		customer_repository = CustomerRepository.new
		customer_repository.create_customer_objects
		result = customer_repository.customers[0].created_at.class
		assert_equal String, result
	end

	def test_customer_objects_have_a_string_for_updated_at
		customer_repository = CustomerRepository.new
		customer_repository.create_customer_objects
		result = customer_repository.customers[0].updated_at.class
		assert_equal String, result
	end

end
