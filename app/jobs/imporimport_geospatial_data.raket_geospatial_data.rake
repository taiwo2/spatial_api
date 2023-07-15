require 'json'

desc 'Import geospatial data'
task import_geospatial_data: :environment do
  file_path = 'db/geospatial_data.geojson'
  data = JSON.parse(File.read(file_path))

  data['features'].each do |feature|
    latitude = feature['geometry']['coordinates'][1]
    longitude = feature['geometry']['coordinates'][0]
    value = feature['properties']['value']

    SpatialLayer.create(latitude: latitude, longitude: longitude, value: value)
  end

  puts 'Geospatial data imported successfully!'
end
