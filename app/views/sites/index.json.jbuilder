json.array!(@sites) do |site|
  json.extract! site, :id, :name, :user_id, :theme_id, :category_id
  json.url site_url(site, format: :json)
end
