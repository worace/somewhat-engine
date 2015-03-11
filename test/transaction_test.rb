require_relative './test_helper'

class TransactionTest < Minitest::Spec

  @@flag = nil
  before do
    unless @@flag
      @@engine = SalesEngine.new("./data")
      @@engine.startup
      @@flag = true
    end
    @transaction = @@engine.transaction_repository.transactions[1]
  end 

  def test_it_has_a_transaction_repository
    assert_equal TransactionRepository, @transaction.repository.class
  end

  def test_it_has_an_id
    assert_equal Fixnum, @transaction.id.class
  end

  def test_it_has_an_invoice_id
    assert_equal Fixnum, @transaction.invoice_id.class
  end

  def test_it_has_a_credit_card_number
    assert_equal String, @transaction.credit_card_number.class
  end

  def test_it_has_a_credit_card_expiration_date
    assert_equal nil, @transaction.credit_card_expiration_date
  end

  def test_it_has_a_result
    assert_equal "success", @transaction.result
  end

  def test_it_has_a_created_at_date
    assert_equal Date, @transaction.created_at.class
  end

  def test_it_has_an_updated_at_date
    assert_equal Date, @transaction.updated_at.class
  end

  def test_it_can_return_its_invoice
    result = @transaction.invoice_id
    assert_equal result, @transaction.invoice.id 
  end

end