json.array!(@organizations) do |organization|
  json.extract! organization, :id, :buildingname, :address, :city, :zip, :telephone, :kind, :department_fields
  json.url organization_url(organization, format: :json)
end
