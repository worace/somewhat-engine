require 'csv'
require './lib/transactions'

class TransactionsParser

  attr_accessor :transactions_data

  def initialize(file_path)
    @transactions_data = CSV.open(file_path,
                                  headers: true,
                                  header_converters: :symbol)
  end
end