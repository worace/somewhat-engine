class Invoice

  attr_accessor :repository,
                :id,
                :customer_id,
                :merchant_id,
                :status,
                :created_at,
                :updated_at

  def initialize(repository, data)
    @repository = repository
    @id = data[:id].to_i
    @customer_id = data[:customer_id].to_i
    @merchant_id = data[:merchant_id].to_i
    @status = data[:status]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

end