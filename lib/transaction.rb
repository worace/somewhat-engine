class Transaction

  attr_accessor :repository,
                :id,
                :invoice_id,
                :credit_card_number,
                :credit_card_expiration_date,
                :result,
                :created_at,
                :updated_at

  def initialize(repository, data)
    @repository                  = repository
    @id                          = data[:id].to_i
    @invoice_id                  = data[:invoice_id].to_i
    @credit_card_number          = data[:credit_card_number]
    @credit_card_expiration_date = data[:credit_card_expiration_date]
    @result                      = data[:result]
    @created_at                  = Date.parse(data[:created_at])
    @updated_at                  = Date.parse(data[:updated_at])
  end

  def invoice
    invoice_repository.find_by_id(invoice_id)
  end

  private

  def sales_engine
    repository.parent_engine
  end

  def invoice_repository
    sales_engine.invoice_repository
  end

end
