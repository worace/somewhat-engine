require_relative './merchant'
require 'csv'

class MerchantParser

  attr_accessor :merchant_data

  def initialize(file_path)
    @merchant_data = CSV.open(file_path,
                              headers: true,
                              header_converters: :symbol
                              )
  end

end
