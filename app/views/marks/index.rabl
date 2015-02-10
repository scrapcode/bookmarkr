collection @marks
attributes :id, :user_id, :title, :url, :created_at, :updated_at
child(:tags) { attributes :id, :name }
