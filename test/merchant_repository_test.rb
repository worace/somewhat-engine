require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test 

	def test_the_merchant_array_starts_empty
		merchant_repository = MerchantRepository.new
		result = merchant_repository.merchants
		assert_equal result, []
	end

	def test_it_creates_an_array_of_objects
		merchant_repository = MerchantRepository.new
		merchant_repository.create_merchant_objects
		result = merchant_repository.merchants.class
		assert_equal Array, result
	end

	def test_it_creates_an_array_of_merchant_objects_from_CSV
		merchant_repository = MerchantRepository.new
		merchant_repository.create_merchant_objects
		result = merchant_repository.merchants[0].class
		assert_equal Merchant, result
	end

	def test_merchant_objects_reflect_merchant_repository_as_their_repository_of_record
		merchant_repository = MerchantRepository.new
		merchant_repository.create_merchant_objects
		result = merchant_repository.merchants[0].repository.class
		assert_equal MerchantRepository, result
		result = merchant_repository.merchants[0].repository
		assert_equal merchant_repository, result
	end

end