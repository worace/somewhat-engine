class CustomerParser

  attr_accessor :customers

  def initialize(file_path)
    @customers = CSV.open(file_path,
                              headers: true,
                              header_converters: :symbol
                              )
  end

end
