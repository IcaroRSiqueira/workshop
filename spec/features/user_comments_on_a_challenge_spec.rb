require 'rails_helper'

feature 'User comments on a challenge' do
  scenario 'successfully' do
    challenge = create(:challenge, title: 'Desafio 01', 
                                   description: 'Quanto é 10 + 10')
    user = create(:user, email: 'test@123.com')
    login_as user

    visit root_path
    click_on 'Desafios'
    click_on 'Desafio 01'
    fill_in 'Comentário', with: 'Muito fácil, manda mais'
    click_on 'Comentar'

    expect(page).to have_content('Comentário enviado com sucesso')
    expect(page).to have_css('h5', text: 'test@123.com')
    expect(page).to have_css('p', text: 'Muito fácil, manda mais')
  end
end