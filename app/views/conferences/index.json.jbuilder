json.array!(@conferences) do |conference|
  json.extract! conference, :id, :name, :date, :locationname, :locationstreet, :locationnumber, :locationcity, :locationzip
  json.url conference_url(conference, format: :json)
end
