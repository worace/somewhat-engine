require './test/test_helper'

class MerchantTest < Minitest::Test 

	def setup
		@merchant = Merchant.new('fake repository', 
															id: '1',
															name: 'Target',   
															created_at: '2012',	
															updated_at: '2014')
	end

	# def test_merchant_objects_can_store_a_repository
	# 	assert_equal 'fake repository', @merchant.repository
	# end

	# def test_merchant_objects_have_a_fixnum_for_id
	# 	assert_equal Fixnum, @merchant.id.class
	# end

	# def test_merchant_objects_have_a_string_for_name
	# 	assert_equal String, @merchant.name.class
	# end

	# def test_merchant_objects_have_a_string_for_created_at
	# 	assert_equal String, @merchant.created_at.class
	# end

	# def test_merchant_objects_have_a_string_for_updated_at
	# 	assert_equal String, @merchant.updated_at.class
	# end

# Business intelligence tests below 
	# def test_it_can_return_an_array_of_all_invoices
	# 	# skip   # Revenue method added second part
	# 	engine = SalesEngine.new("./data")
	# 	engine.startup
	# 	merchant = engine.merchant_repository.merchant[0]
	# 	result = merchant.invoices
	# 	assert_equal Array, result.class 
	# end

	def test_it_can_return_an_array_of_invoice_items
		engine = SalesEngine.new("./data")
		engine.startup
		merchant = engine.merchant_repository.merchant[0]
		result = merchant.invoice_items
		assert_equal Array, result.class
		assert_equal InvoiceItem, result[0]
	end



end
