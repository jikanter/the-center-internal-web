json.array!(@registrants) do |registrant|
  json.extract! registrant, :id, :firstname, :lastname, :middleinitial, :homenumber, :homestreet, :homecity, :homestate, :homezip, :homephone, :cellphone, :businessname, :businessnumber, :businessstreet, :businesscity, :businessstate, :businesszip
  json.url registrant_url(registrant, format: :json)
end
