require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/merchant'

class MerchantTest < Minitest::Test 
	def test_it_exists
		assert true
	end

	def test_it_doesnt_need_a_name
		merchant = Merchant.new
		result = merchant.name 
		assert_equal "No_Name", result
	end

	def test_it_doesnt_need_a_created_date
		merchant = Merchant.new
		result = merchant.created_at
		assert_equal "No_Date", result
	end

	def test_it_doesnt_need_a_updated_date
		merchant = Merchant.new
		result = merchant.updated_at
		assert_equal "No_Update", result
	end

	def test_it_doesnt_need_an_id
		merchant = Merchant.new
		result = merchant.id
		assert_equal "No_ID", result
	end

	def test_it_has_a_name
		merchant = Merchant.new(1, "Tony", "05-05-1980", "03-05-2015")
		result = merchant.name 
		assert_equal "Tony", result
	end

	def test_it_has_a_created_date
		merchant = Merchant.new(1, "Tony", "05-05-1980", "03-05-2015")
		result = merchant.created_at
		assert_equal "05-05-1980", result
	end

	def test_it_has_a_updated_date
		merchant = Merchant.new(1, "Tony", "05-05-1980", "03-05-2015")
		result = merchant.updated_at
		assert_equal "03-05-2015", result
	end

	def test_it_has_an_id
		merchant = Merchant.new(1, "Tony", "05-05-1980", "03-05-2015")
		result = merchant.id
		assert_equal 1, result
	end
end
