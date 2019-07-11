json.extract! story, :id, :title, :slug, :code, :pages, :publication_date, :description, :created_at, :updated_at
json.url story_url(story, format: :json)
