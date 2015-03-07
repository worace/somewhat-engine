require 'csv'
require './lib/item'
#require_relative './item'

class ItemParser

  attr_accessor :item_data

  def initialize(file_path)
    @item_data = CSV.open(file_path,
                          headers: true,
                          header_converters: :symbol)
  end
end

# if __FILE__ == $0
#   item_parser = ItemParser.new
#   item_parser.read_item_data_from_csv_file
#   puts item_parser.item_data
# end