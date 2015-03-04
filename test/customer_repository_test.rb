require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test 

	def test_the_customer_array_starts_empty
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

end