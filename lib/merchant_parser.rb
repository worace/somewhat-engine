require_relative './merchant'
require 'csv'

class MerchantParser

	attr_accessor :merchant_data, :merchants

	def initialize
		@merchants =  {}
	end

	def read_merchant_data_from_csv_file
		@merchant_data = CSV.open "../data/merchants.csv", headers: true, header_converters: :symbol
	end

	def create_merchant_objects
		@merchant_data.each do |data|
			key = data[:id]
			@merchants[key] = Merchant.new(data[:id],data[:name],data[:created_at],data[:updated_at])
		end
	end

	def print_out_all_data_from_csv_file
		@merchant_data.each {|data| puts data}
	end
end

if __FILE__ == $0
	merchant_parse = MerchantParser.new
	puts merchant_parse.merchants

	# merchant_parse.read_merchant_data_from_csv_file
	# merchant_parse.create_merchant_objects
	# puts merchant_parse.merchants
	merchant_parser = MerchantParser.new
	merchant_parser.read_merchant_data_from_csv_file
	merchant_parser.create_merchant_objects
	result = merchant_parser.merchants
	puts result[merchant_parser.merchants.keys.sample].class

end