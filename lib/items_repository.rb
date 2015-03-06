require './lib/items'

class ItemRepository

  attr_accessor :items,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @items = data.map do |element|
      (element.kind_of? Item) ? element : (Item.new(self,element))
    end
  end

  def all
    ItemRepository.new(
      items,
      parent_engine
    ).items
  end

  def random
    ItemRepository.new(
      [items.sample],
      parent_engine
    ).items
  end

  def find_by_id(match)
    ItemRepository.new(
      [items.find {|data| data.id == match}],
      parent_engine
    ).items
  end

  def find_by_name(match)
    ItemRepository.new(
      [items.find {|data| data.name.downcase == match.downcase}],
      parent_engine
    ).items
  end

  def find_by_description(match)
    ItemRepository.new(
      [items.find {|data| data.description.downcase == match.downcase}],
      parent_engine
    ).items
  end

  def find_by_unit_price(match)
    ItemRepository.new(
      [items.find {|data| data.unit_price == match}],
      parent_engine
    ).items
  end

  def find_by_merchant_id(match)
    ItemRepository.new(
      [items.find {|data| data.merchant_id == match}],
      parent_engine
    ).items    
  end

  def find_by_created_at(match)
    ItemRepository.new(
      [items.find {|data| data.created_at.downcase == match.downcase}],
      parent_engine
    ).items
  end

  def find_by_updated_at(match)
    ItemRepository.new(
      [items.find {|data| data.updated_at.downcase == match.downcase}],
      parent_engine
    ).items
  end

  def find_all_by_id(match)
    ItemRepository.new(
      items.find_all {|data| data.id == match},
      parent_engine
    ).items
  end

  def find_all_by_name(match)
    ItemRepository.new(
      items.find_all {|data| data.name.downcase == match.downcase},
      parent_engine
    ).items
  end

  def find_all_by_description(match)
    ItemRepository.new(
      items.find_all {|data| data.description.downcase == match.downcase},
      parent_engine
    ).items
  end

  def find_all_by_unit_price(match)
    ItemRepository.new(
      items.find_all {|data| data.unit_price == match},
      parent_engine
    ).items
  end

  def find_all_by_merchant_id(match)
    ItemRepository.new(
      items.find_all {|data| data.merchant_id == match},
      parent_engine
    ).items
  end

  def find_all_by_created_at(match)
    ItemRepository.new(
      items.find_all {|data| data.created_at.downcase == match.downcase},
      parent_engine
    ).items
  end

  def find_all_by_updated_at(match)
    ItemRepository.new(
      items.find_all {|data| data.updated_at.downcase == match.downcase},
      parent_engine
    ).items
  end

end

if __FILE__ == $0
  item_repository = ItemRepository.new
  puts item_repository.find_all_by_updated_at("2012-03-27 14:53:59 UTC").size
end