json.array!(@editors) do |editor|
  json.extract! editor, :id, :title, :post, :tags, :user_id
  json.url editor_url(editor, format: :json)
end
