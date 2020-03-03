require 'rails_helper'

feature 'User visits home page' do
  scenario 'successfully' do
    login_as create(:user)

    visit root_path
    
    expect(page).to have_content 'Bem vindo ao Workshop Treinadev'
  end
end