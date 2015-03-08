require 'csv'
# require './lib/merchant'
require_relative './merchant'

class MerchantParser

  attr_accessor :merchant_data

  def initialize(file_path)
    @merchant_data = CSV.open(file_path,
                              headers: true,
                              header_converters: :symbol)
  end
end

# if __FILE__ == $0
#   puts merchant_parser = MerchantParser.new("./data/merchants.csv")
#   puts merchant_parser.merchant_data
# end