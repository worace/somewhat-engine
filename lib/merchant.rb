class Merchant

	attr_accessor :repository, :id, :name, :created_at, :updated_at

	def initialize(repository = "No_Repo",id = "No_ID",name = "No_Name",created = "No_Date",updated = "No_Update")
		@repository = repository
		@id = id
		@name = name
		@created_at = created
		@updated_at = updated
	end
end
