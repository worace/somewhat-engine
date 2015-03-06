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
    @unit_price = data[:unit_price].to_i
    @merchant_id = data[:merchant_id].to_i
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end
end