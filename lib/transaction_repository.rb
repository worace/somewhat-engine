# require './lib/transaction'
require_relative './transaction'

class TransactionRepository

  attr_accessor :transaction,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @transaction = data.map {|element| (Transaction.new(self,element))}
  end

  def all
      transaction
  end

  def random
      transaction.sample
  end

  def find_by_id(match)
      transaction.find {|data| data.id == match}
  end

  def find_by_invoice_id(match)  
      transaction.find {|data| data.invoice_id == match}
  end

  def find_by_credit_card_number(match)
      transaction.find {|data| data.credit_card_number == match}
  end

  def find_by_credit_card_expiration_date(match)
      transaction.find {|data| data.credit_card_expiration_date == match}
  end

  def find_by_result(match)
      transaction.find {|data| data.result == match}
  end

  def find_by_created_at(match)
      transaction.find {|data| data.created_at.downcase == match.downcase}
  end

  def find_by_updated_at(match)
      transaction.find {|data| data.updated_at.downcase == match.downcase}
  end

   def find_all_by_id(match)
      transaction.find_all {|data| data.id == match}
  end

  def find_all_by_invoice_id(match)  
      transaction.find_all {|data| data.invoice_id == match}
  end

  def find_all_by_credit_card_number(match)
      transaction.find_all {|data| data.credit_card_number == match}
  end

  def find_all_by_credit_card_expiration_date(match)
      transaction.find_all {|data| data.credit_card_expiration_date == match}
  end

  def find_all_by_result(match)
      transaction.find_all {|data| data.result == match}
  end

  def find_all_by_created_at(match)
      transaction.find_all {|data| data.created_at.downcase == match.downcase}
  end

  def find_all_by_updated_at(match)
      transaction.find_all {|data| data.updated_at.downcase == match.downcase}
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

end

# if __FILE__ == $0
  
# end