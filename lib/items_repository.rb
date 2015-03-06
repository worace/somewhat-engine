require './lib/items'

class ItemRepository

  attr_accessor :items,
                :parent_engine

  def initialize(data,sales_engine = nil)
    @parent_engine = sales_engine
    @items = []
    @data = data
    create_item_objects
  end

  def create_item_objects
    @data.item_data.each do |data|
      @items << Item.new(self,data)
    end
  end

  def all
    items
  end

  def random
    items.sample
  end

  def find_by_id(match)
    items.find {|data| data.id == match}
  end

  def find_by_name(match)
    items.find {|data| data.name.downcase == match.downcase}
  end

  def find_by_description(match)
    items.find {|data| data.description.downcase == match.downcase}
  end

  def find_by_unit_price(match)
    items.find {|data| data.unit_price == match}
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
    items.find_all do |data|
      data.id == match
    end
  end

  def find_all_by_name(match)
    items.find_all do |data|
      data.name.downcase == match.downcase
    end
  end

  def find_all_by_description(match)
    items.find_all do |data|
      data.description.downcase == match.downcase
    end
  end

  def find_all_by_unit_price(match)
    items.find_all do |data|
      data.unit_price == match
    end
  end

  def find_all_by_merchant_id(match)
    items.find_all do |data|
      data.merchant_id == match
    end
  end

  def find_all_by_created_at(match)
    items.find_all do |data|
      data.created_at.downcase == match.downcase
    end
  end

  def find_all_by_updated_at(match)
    items.find_all do |data|
      data.updated_at.downcase == match.downcase
    end
  end

end

if __FILE__ == $0
  item_repository = ItemRepository.new
  puts item_repository.find_all_by_updated_at("2012-03-27 14:53:59 UTC").size
end