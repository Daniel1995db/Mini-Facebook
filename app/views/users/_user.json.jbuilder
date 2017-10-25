json.extract! user, :id, :fname, :lname, :username, :password, :photo, :position, :created_at, :updated_at
json.url user_url(user, format: :json)
