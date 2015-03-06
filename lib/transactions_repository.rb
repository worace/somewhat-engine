require './lib/transactions'

class TransactionRepository

  attr_accessor :transactions,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @transactions = data.map do |element|
      (element.kind_of? Transaction) ? element : (Transaction.new(self,element))
    end
  end

  def all
    TransactionRepository.new(
      transactions,
      parent_engine
    ).transactions
  end

  def random
    TransactionRepository.new(
      [transactions.sample],
      parent_engine
    ).transactions
  end

  def find_by_id(match)
    TransactionRepository.new(
      [transactions.find {|data| data.id == match}],
      parent_engine
    ).transactions
  end

  def find_by_invoice_id(match)  
    TransactionRepository.new(
      [transactions.find {|data| data.invoice_id == match}],
      parent_engine
    ).transactions
  end

  def find_by_credit_card_number(match)
    TransactionRepository.new(
      [transactions.find {|data| data.credit_card_number == match}],
      parent_engine
    ).transactions
  end

  def find_by_credit_card_expiration_date(match)
    TransactionRepository.new(
      [transactions.find {|data| data.credit_card_expiration_date == match}],
      parent_engine
    ).transactions
  end

  def find_by_result(match)
    TransactionRepository.new(
      [transactions.find {|data| data.result == match}],
      parent_engine
    ).transactions
  end

  def find_by_created_at(match)
    TransactionRepository.new(
      [transactions.find {|data| data.created_at.downcase == match.downcase}],
      parent_engine
    ).transactions
  end

  def find_by_updated_at(match)
    TransactionRepository.new(
      [transactions.find {|data| data.updated_at.downcase == match.downcase}],
      parent_engine
    ).transactions
  end

   def find_all_by_id(match)
    TransactionRepository.new(
      transactions.find_all {|data| data.id == match},
      parent_engine
    ).transactions
  end

  def find_all_by_invoice_id(match)  
    TransactionRepository.new(
      transactions.find_all {|data| data.invoice_id == match},
      parent_engine
    ).transactions
  end

  def find_all_by_credit_card_number(match)
    TransactionRepository.new(
      transactions.find_all {|data| data.credit_card_number == match},
      parent_engine
    ).transactions
  end

  def find_all_by_credit_card_expiration_date(match)
    TransactionRepository.new(
      transactions.find_all {|data| data.credit_card_expiration_date == match},
      parent_engine
    ).transactions
  end

  def find_all_by_result(match)
    TransactionRepository.new(
      transactions.find_all {|data| data.result == match},
      parent_engine
    ).transactions
  end

  def find_all_by_created_at(match)
    TransactionRepository.new(
      transactions.find_all {|data| data.created_at.downcase == match.downcase},
      parent_engine
    ).transactions
  end

  def find_all_by_updated_at(match)
    TransactionRepository.new(
      transactions.find_all {|data| data.updated_at.downcase == match.downcase},
      parent_engine
    ).transactions
  end

end

# if __FILE__ == $0
  
# end