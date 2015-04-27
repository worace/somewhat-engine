require_relative './test_helper'

class TransactionRepositoryTest < Minitest::Spec

  @@flag = nil
  before do
    unless @@flag
      @@engine = SalesEngine.new("./data")
      @@engine.startup
      @@flag = true
    end
    @repo = @@engine.transaction_repository
    @transaction = @repo.find_by_id(10)
  end 

  def test_it_has_a_sales_engine
    assert_equal SalesEngine, @repo.parent_engine.class
  end

  def test_it_stores_transactions
    assert_equal Array, @repo.transactions.class
    assert_equal Transaction, @repo.transactions[0].class
  end

  def test_it_can_return_all_transactions
    result = @repo.all.size
    assert @repo.transactions.size, result
  end

  def test_it_can_return_a_random_transaction
    assert_equal Transaction, @repo.random.class
  end

  def test_it_can_find_by_id
    result = @transaction.id
    assert_equal @transaction, @repo.find_by_id(result)
  end

  def test_it_can_find_by_invoice_id
    result = @transaction.invoice_id
    assert_equal @transaction, @repo.find_by_invoice_id(result)
  end

  def test_it_can_find_by_status
    assert_equal Transaction, @repo.find_by_result("success").class
    assert_equal Transaction, @repo.find_by_result("failed").class
  end

  def test_it_can_find_all_by_id
    assert_equal 1, @repo.find_all_by_id(@transaction.id).size
  end

  def test_it_can_find_all_by_invoice_id
    assert_equal 1, @repo.find_all_by_invoice_id(@transaction.invoice_id).size
  end

  def test_it_finds_all_by_result
    assert_equal 4648, @repo.find_all_by_result("success").size
    assert_equal 947, @repo.find_all_by_result("failed").size
  end

end


