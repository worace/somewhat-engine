require_relative './merchant'
require 'csv'

class MerchantParser

	attr_accessor :merchant_data

	def read_merchant_data_from_csv_file
		@merchant_data = CSV.open "../data/merchants.csv", headers: true, header_converters: :symbol
	end

	def print_out_all_data_from_csv_file
		@merchant_data.each {|data| puts data}
	end
end

if __FILE__ == $0
	merchant_parser = MerchantParser.new
	merchant_parser.read_merchant_data_from_csv_file
	merchant_parser.create_merchant_objects
	puts merchant_parser.merchants
end