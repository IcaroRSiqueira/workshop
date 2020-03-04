require 'rails_helper'

feature 'User comments on a challenge' do
  scenario 'successfully' do
    challenge = create(:challenge, title: 'Desafio 01', 
                                   description: 'Quanto é 10 + 10')
    user = create(:user, email: 'test@123.com')
    another_user = create(:user, email: 'another_user@test.com')
    create(:solution, result: 'Acho que é 40', challenge: challenge,
                      user: another_user)
    login_as user

    visit root_path
    click_on 'Desafios'
    click_on 'Desafio 01'
    click_on 'Soluções'
    click_on 'another_user@test.com'
    fill_in 'Comentário', with: 'Errado, use a calculadora'
    click_on 'Comentar'

    expect(page).to have_content('Comentário enviado com sucesso')
    expect(page).to have_css('h5', text: 'test@123.com')
    expect(page).to have_css('p', text: 'Errado, use a calculadora')
    expect(page).to have_css 'p', text: 'Acho que é 40'
  end
end