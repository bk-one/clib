json.extract! comic, :id, :title, :issue, :pages, :dimensions, :cover_price, :currency, :cover_date, :upc, :created_at, :updated_at
json.url comic_url(comic, format: :json)
