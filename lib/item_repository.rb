require_relative './item_parser'
require_relative './item'

class ItemRepository

  attr_accessor :items,
                :parent_engine,
                :data_storage

  def initialize(sales_engine = nil)
    @parent_engine = sales_engine
    @items = []
    @item_parser = ItemParser.new
    @item_parser.read_item_data_from_csv_file
    create_item_objects
  end

  def create_item_objects
    @item_parser.item_data.each do |data|
      @items << Item.new(self,data)
    end
  end

  def clear_data_storage
    @data_storage = []
  end

  def all
    items
  end

  def random
    items.sample
  end

  def find_by_id(match)
    items.find do |data|
      data.id == match
    end
  end

  def find_by_name(match)
    items.find do |data|
      data.name.downcase == match.downcase
    end
  end

  def find_by_description(match)
    items.find do |data|
      data.description.downcase == match.downcase
    end
  end

  def find_by_unit_price(match)
    items.find do |data|
      data.unit_price == match
    end
  end

  def find_by_merchant_id(match)
    items.find do |data|
      data.merchant_id == match
    end
  end

  def find_by_created_at(match)
    items.find do |data|
      data.created_at.downcase == match.downcase
    end
  end

  def find_by_updated_at(match)
    items.find do |data|
      data.updated_at.downcase == match.downcase
    end
  end

    def find_all_by_id(match)
    clear_data_storage
    @data_storage = items.find_all do |data|
      data.id == match
    end
  end

  def find_all_by_name(match)
    clear_data_storage
    @data_storage = items.find_all do |data|
      data.name.downcase == match.downcase
    end
  end

  def find_all_by_description(match)
    clear_data_storage
    @data_storage = items.find_all do |data|
      data.description.downcase == match.downcase
    end
  end

  def find_all_by_unit_price(match)
    clear_data_storage
    @data_storage = items.find_all do |data|
      data.unit_price == match
    end
  end

  def find_all_by_merchant_id(match)
    clear_data_storage
    @data_storage = items.find_all do |data|
      data.merchant_id == match
    end
  end

  def find_all_by_created_at(match)
    clear_data_storage
    @data_storage = items.find_all do |data|
      data.created_at.downcase == match.downcase
    end
  end

  def find_all_by_updated_at(match)
    clear_data_storage
    @data_storage = items.find_all do |data|
      data.updated_at.downcase == match.downcase
    end
  end

end


if __FILE__ == $0
  item_repository = ItemRepository.new
  puts item_repository.find_all_by_updated_at("2012-03-27 14:53:59 UTC").size
end