class TransactionParser

  attr_accessor :transactions

  def initialize(file_path)
    @transactions = CSV.open(file_path,
                                 headers: true,
                                 header_converters: :symbol
                                 )
  end

end
