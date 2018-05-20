json.extract! @post, :id, :username, :post, :created_at
json.url post_url(@post, format: :json)
