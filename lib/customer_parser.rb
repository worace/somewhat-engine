require_relative './customer'
require 'csv'

class CustomerParser

  attr_accessor :customer_data

  def initialize(file_path)
    @customer_data = CSV.open(file_path,
                              headers: true,
                              header_converters: :symbol
                              )
  end

end
