json.array!(@books) do |book|
  json.extract! book, :id, :author, :title, :status, :isbn, :rating, :active, :approved_at
  json.url book_url(book, format: :json)
end
