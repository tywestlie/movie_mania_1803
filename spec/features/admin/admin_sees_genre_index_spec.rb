require 'rails_helper'

describe 'admin visits genre index' do
  it 'sees a list of all genres' do
    admin = User.create(username: "Dee", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    genre1 = Genre.create(name: 'action')
    genre2 = Genre.create(name: 'romance')

    visit genres_path

    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre1.name)
  end
end
