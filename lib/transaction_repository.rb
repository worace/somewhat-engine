require_relative './transaction'

class TransactionRepository

  attr_accessor :transactions,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @transactions  = data.map {|element| (Transaction.new(self,element))}
  end

  def run_credit_card(data,id)
    new_transaction = Transaction.new(self,
                                      id: transactions.last.id + 1,
                                      invoice_id: id,
                                      credit_card_number: data[:credit_card_number],
                                      credit_card_expiration_date: data[:credit_card_expiration],
                                      result: data[:result],
                                      created_at: Time.now.strftime("%d/%m/%Y %H:%M"),
                                      updated_at: Time.now.strftime("%d/%m/%Y %H:%M")
                                     )
    transactions << new_transaction
  end

  def all
    transactions
  end

  def random
    transactions.sample
  end

  def find_by_id(match)
    transactions.find {|data| data.id == match}
  end

  def find_by_invoice_id(match)  
    transactions.find {|data| data.invoice_id == match}
  end

  def find_by_credit_card_number(match)
    transactions.find {|data| data.credit_card_number == match}
  end

  def find_by_credit_card_expiration_date(match)
    transactions.find {|data| data.credit_card_expiration_date == match}
  end

  def find_by_result(match)
    transactions.find {|data| data.result == match}
  end

  def find_by_created_at(match)
    transactions.find {|data| data.created_at.downcase == match.downcase}
  end

  def find_by_updated_at(match)
    transactions.find {|data| data.updated_at.downcase == match.downcase}
  end

  def find_all_by_id(match)
    transactions.find_all {|data| data.id == match}
  end

  def find_all_by_invoice_id(match)  
    transactions.find_all {|data| data.invoice_id == match}
  end

  def find_all_by_credit_card_number(match)
    transactions.find_all {|data| data.credit_card_number == match}
  end

  def find_all_by_credit_card_expiration_date(match)
    transactions.find_all {|data| data.credit_card_expiration_date == match}
  end

  def find_all_by_result(match)
    transactions.find_all {|data| data.result == match}
  end

  def find_all_by_created_at(match)
    transactions.find_all {|data| data.created_at.downcase == match.downcase}
  end

  def find_all_by_updated_at(match)
    transactions.find_all {|data| data.updated_at.downcase == match.downcase}
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

end

# if __FILE__ == $0
  
# end