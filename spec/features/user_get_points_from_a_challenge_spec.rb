require 'rails_helper'

feature 'User get points from a challenge' do
  scenario 'sucessfully' do
    create(:challenge, title: 'Desafio 01', points: 200,
                       description: 'Quanto é 10 + 10')
    user = create(:user)
    initial_points = user.score
    login_as user

    visit root_path
    click_on 'Desafios'
    click_on 'Desafio 01'
    click_on 'Responder'
    fill_in 'Resultado', with: '20'
    click_on 'Enviar'
    user.reload

    expect(page).to have_content('Sua pontuação: 200')
    expect(user.score).to eq(initial_points + 200)
  end
end