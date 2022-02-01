require 'csv' 
desc "importing station data from csv file" 
task :import => :environment do
filename = "notes/station-data.csv"
CSV.foreach(filename, :headers => true) do |row| 
    Station.create!(row.to_hash)   
end
end