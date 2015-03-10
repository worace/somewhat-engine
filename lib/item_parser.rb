require_relative './item'
require 'csv'

class ItemParser

  attr_accessor :item_data

  def initialize(file_path)
    @item_data = CSV.open(file_path,
                          headers: true,
                          header_converters: :symbol
                          )
  end
  
end
