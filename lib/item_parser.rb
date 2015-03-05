require_relative './item'
require 'csv'

class ItemParser

  attr_accessor :item_data

  def read_item_data_from_csv_file
    @item_data = CSV.open("../data/items.csv",
                              headers: true,
                              header_converters: :symbol)
  end

  def print_out_all_data_from_csv_file
    @item_data.each {|data| puts data}
  end

end

if __FILE__ == $0
  item_parser = ItemParser.new
  item_parser.read_item_data_from_csv_file
  puts item_parser.item_data
end