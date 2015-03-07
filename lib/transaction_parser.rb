require 'csv'
require './lib/transaction'
# require_relative './transaction'

class TransactionParser

  attr_accessor :transaction_data

  def initialize(file_path)
    @transaction_data = CSV.open(file_path,
                                 headers: true,
                                 header_converters: :symbol)
  end
end