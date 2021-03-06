class TransactionRepository

  attr_accessor :transactions,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @transactions  = data.map { |element| (Transaction.new(self, element)) }
  end

  def inspect
    "#<#{self.class} #{transactions.size} rows>"
  end

  def run_credit_card(data, id)
    new_transaction = create_transaction(data, id)
    transactions << new_transaction
  end

  def all
    transactions
  end

  def random
    transactions.sample
  end

  def find_by_id(id)
    transactions.find {|data| data.id == id}
  end

  def find_by_invoice_id(id)
    transactions.find {|data| data.invoice_id == id}
  end

  def find_all_by_id(id)
    transactions.find_all {|data| data.id == id}
  end

  def find_all_by_invoice_id(id)
    transactions.find_all {|data| data.invoice_id == id}
  end

  def find_all_by_result(result)
    transactions.find_all {|data| data.result == result}
  end
end
