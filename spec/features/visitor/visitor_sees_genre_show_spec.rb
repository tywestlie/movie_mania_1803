require 'rails_helper'

describe 'visitor sees genre show page' do
  it 'sees all movies associated with that genre' do
      genre1 = Genre.create(name: 'action')
      director1 = Director.create(name:'Bob')
      movie1 = genre1.movies.create(title: 'Movie One', description: 'great film', rating: 5, director_id: director1.id)
      movie2 = genre1.movies.create(title: 'Movie Two', description: 'bad film', rating: 2, director_id: director1.id)

      visit genre_path(genre1)

      expect(page).to have_content(movie1.title)
      expect(page).to have_content(movie2.title)
  end
end
