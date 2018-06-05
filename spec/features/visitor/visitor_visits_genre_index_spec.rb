require 'rails_helper'

describe 'visitor visits genre index page' do
  it 'can see all genres' do
    genre1 = Genre.create(name: 'action')
    genre2 = Genre.create(name: 'romance')

    visit genres_path

    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
  end

  it 'it cannot create new genre' do
    genre1 = Genre.create(name: 'action')
    genre2 = Genre.create(name: 'romance')
    director1 = Director.create(name:'Bob')
    movie1 = genre1.movies.create(title: 'Movie One', description: 'great film', rating: 5, director_id: director1.id)


    visit genres_path

    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
    expect(page).to_not have_content('Create New Genre')
  end

  it 'it can link to genre show page' do
    genre1 = Genre.create(name: 'action')
    genre2 = Genre.create(name: 'romance')

    visit genres_path

    click_on genre1.name

    expect(current_path).to eq genre_path(genre1)
  end
end
