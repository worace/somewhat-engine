class ItemParser

  attr_accessor :items

  def initialize(file_path)
    @items = CSV.open(file_path,
                          headers: true,
                          header_converters: :symbol
                          )
  end

end
