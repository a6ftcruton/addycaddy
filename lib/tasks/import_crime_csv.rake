namespace :csv_importer do

  desc "Write updated crime data to Crimes table"
  task :write_crimes_data do
    #crimes_uri   = URI.parse('http://data.denvergov.org/download/gis/crime/csv/crime.csv')
    #csv_importer = CSVImporter.new(uri)
    #csv          = csv_importer.read_file

    #Crime.copy_from csv, :map => {'geo_lon' => 'longitude', 'geo_lat' => 'latitude'}
      
  end
end
