json.extract! timeline, :id, :parent_id, :created_at, :updated_at, :start_date, :worlds
json.url timeline_url(timeline, format: :json)
