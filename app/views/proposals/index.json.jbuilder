json.array!(@sessions) do |session|
  json.extract! session, :id, :presenterid, :copresenter_id, :conferenceid, :title, :description, :starttime, :endtime, :strand, :roomid, :level, :setuporderid, :language
  json.url session_url(session, format: :json)
end
