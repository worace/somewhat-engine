class Merchant

	attr_accessor :id, :name, :created_at, :updated_at

	def initialize(id = "No_ID",name = "No_Name",created = "No_Date",updated = "No_Update")
		@id = id
		@name = name
		@created_at = created
		@updated_at = updated
	end
end
