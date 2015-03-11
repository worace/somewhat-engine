require_relative './test_helper'

class CustomerTest < Minitest::Spec

	@@flag = nil
  before do
    unless @@flag
      @@engine = SalesEngine.new("./data")
      @@engine.startup
      @@flag = true
    end
    @customer = @@engine.customer_repository.random
  end 

  def test_it_has_a_customer_repository
  	assert_equal CustomerRepository, @customer.repository.class
  end	

  def test_it_has_an_id
  	assert_equal Fixnum, @customer.id.class
  end

  def test_it_has_a_first_name
  	assert_equal String, @customer.first_name.class
  end

  def test_it_has_a_last_name
  	assert_equal String, @customer.last_name.class
  end

  def test_it_has_a_created_at
  	assert_equal Date, @customer.created_at.class
  end

  def test_it_has_an_updated_at
  	assert_equal Date, @customer.updated_at.class
  end
	
  def test_it_can_return_its_invoices
  	assert_equal Array, @customer.invoices.class
  	assert_equal Invoice, @customer.invoices[0].class
  end

  def test_it_can_return_its_transactions
    assert_equal Array, @customer.transactions.class
    assert_equal Transaction, @customer.transactions[0].class
  end

	def test_it_can_find_a_favorite_merchant
		customer = @@engine.customer_repository.customers[50]
		result = customer.favorite_merchant
		assert_equal "Kassulke, O'Hara and Quitzon", result.name
	end

end
