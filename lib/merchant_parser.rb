class MerchantParser

  attr_accessor :merchants

  def initialize(file_path)
    @merchants = CSV.open(file_path,
                              headers: true,
                              header_converters: :symbol
                              )
  end

end
