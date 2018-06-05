class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, through: :movie_genres

  def average_rating
    movies.average(:rating)
  end

  def highest_rated_film
    movies.find
  end
end
