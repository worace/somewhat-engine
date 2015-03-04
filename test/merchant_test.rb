require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/merchant'
require_relative '../lib/merchant_repository'

class MerchantTest < Minitest::Test 

	def test_merchant_objects_have_a_repository
		merchant_repository = MerchantRepository.new
		merchant_repository.create_merchant_objects
		result = merchant_repository.merchants[0].repository
		assert_equal merchant_repository, result
	end

	def test_merchant_objects_have_a_fixnum_for_id
		merchant_repository = MerchantRepository.new
		merchant_repository.create_merchant_objects
		result = merchant_repository.merchants[0].id.class
		assert_equal Fixnum, result
	end

	def test_merchant_objects_have_a_string_for_name
		merchant_repository = MerchantRepository.new
		merchant_repository.create_merchant_objects
		result = merchant_repository.merchants[0].name.class
		assert_equal String, result
	end

	def test_merchant_objects_have_a_string_for_created_at
		merchant_repository = MerchantRepository.new
		merchant_repository.create_merchant_objects
		result = merchant_repository.merchants[0].created_at.class
		assert_equal String, result
	end

	def test_merchant_objects_have_a_string_for_updated_at
		merchant_repository = MerchantRepository.new
		merchant_repository.create_merchant_objects
		result = merchant_repository.merchants[0].updated_at.class
		assert_equal String, result
	end

end
