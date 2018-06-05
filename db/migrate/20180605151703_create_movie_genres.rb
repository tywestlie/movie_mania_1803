class CreateMovieGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_genres do |t|
      t.references :movie, foriegn_key: true
      t.references :genre, foriegn_key: true
    end
  end
end
