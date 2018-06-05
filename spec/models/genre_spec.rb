require 'rails_helper'

describe Genre do
  it 'can average movie ratings within a genre' do
    genre1 = Genre.create(name: 'action')
    director1 = Director.create(name:'Bob')
    movie1 = genre1.movies.create(title: 'Movie One', description: 'great film', rating: 5, director_id: director1.id)
    movie2 = genre1.movies.create(title: 'Movie Two', description: 'bad film', rating: 2, director_id: director1.id)

    average = (movie1.rating + movie2.rating) / 2

    expect(genre1.average_rating.to_i).to eq(average)
  end
end
