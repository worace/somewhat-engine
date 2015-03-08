require 'bigdecimal'
require 'bigdecimal/util'

class Item

  attr_accessor :repository,
                :id,
                :name,
                :description,
                :unit_price,
                :merchant_id,
                :created_at,
                :updated_at

  def initialize(repository, data)
    @repository = repository
    @id = data[:id].to_i
    @name = data[:name]
    @description  = data[:description]
    @unit_price = (data[:unit_price].scan(/\d/).join.to_d)
    @merchant_id = data[:merchant_id].to_i
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  def invoice_items
    repository.parent_engine.invoice_item_repository.find_all_by_item_id(id)
  end

  def merchant
    repository.parent_engine.merchant_repository.find_by_id(merchant_id)
  end

end