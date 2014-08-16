json.array!(@book_ratings) do |book_rating|
  json.extract! book_rating, :id, :rating, :user_id, :book_id
  json.url book_rating_url(book_rating, format: :json)
end
