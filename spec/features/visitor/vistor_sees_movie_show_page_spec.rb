require 'rails_helper'

describe 'visitor visits movie show page' do
  it 'can see all the genres associated with a movie' do
    director1 = Director.create(name:'Bob')
    genre1 = Genre.create(name: 'action')
    genre2 = Genre.create(name: 'romance')
    movie1 = genre1.movies.create(title: 'Movie One', description: 'great film', rating: 5, director_id: director1.id)
    a = MovieGenre.create(movie_id: movie1.id, genre_id: genre2.id)
    # require 'pry'; binding.pry

    visit movie_path(movie1.slug)


    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
  end
end
