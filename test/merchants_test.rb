require './test/test_helper'

class MerchantTest < Minitest::Test 

	def setup
		@merchant = Merchant.new('fake repository', 
															id: '1',
															name: 'Target',   
															created_at: '2012',	
															updated_at: '2014')
	end

	def test_merchant_objects_can_store_a_repository
		assert_equal 'fake repository', @merchant.repository
	end

	def test_merchant_objects_have_a_fixnum_for_id
		assert_equal Fixnum, @merchant.id.class
	end

	def test_merchant_objects_have_a_string_for_name
		assert_equal String, @merchant.name.class
	end

	def test_merchant_objects_have_a_string_for_created_at
		assert_equal String, @merchant.created_at.class
	end

	def test_merchant_objects_have_a_string_for_updated_at
		assert_equal String, @merchant.updated_at.class
	end

end
