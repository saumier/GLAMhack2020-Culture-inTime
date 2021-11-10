json.extract! data_source, :id, :name, :sparql, :email, :loaded, :created_at, :updated_at
json.url data_source_url(data_source, format: :json)
