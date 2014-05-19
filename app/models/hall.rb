class Hall < ActiveRecord::Base
  attr_accessible :adresa, :descriere, :email, :features, :locatie, :nume, :phone, :postcode, :poza, :tipul
  
	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |hall|
				csv << hall.attributes.values_at(column_names)
			end
		end
	end
	
	def self.import(file)
		spreadsheet = open_spreadsheet(file)
		header = spreadsheet.row(1)
		(2..spreadsheet.last_row).collect do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			hall = find_by_id(row["id"]) || new
			hall.attributes = row.to_hash.slice(*Hall.attribute_names())
			hall.save!
		end
	end

	def self.open_spreadsheet(file)
		case File.extname(file)
			when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
			when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
			when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
			else raise "Unknown file type: #{file}"
		end
	end
  
end
