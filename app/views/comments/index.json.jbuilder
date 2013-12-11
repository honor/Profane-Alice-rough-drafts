json.array!(@comments) do |comment|
  json.extract! comment, :text, :length
  json.url comment_url(comment, format: :json)
end