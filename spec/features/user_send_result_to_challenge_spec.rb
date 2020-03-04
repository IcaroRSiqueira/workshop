require 'rails_helper'

feature 'User send result to challenge' do
 scenario 'successfully' do
    create(:challenge, title: 'Desafio 01', 
                       description: 'Quanto é 10 + 10')
    login_as create(:user)

    visit root_path
    click_on 'Desafios'
    click_on 'Desafio 01'
    click_on 'Responder'
    fill_in 'Resultado', with: '20'
    click_on 'Enviar'

    expect(page).to have_css 'h5', text: 'Resultado'
    expect(page).to have_css 'p', text: '20'
  end

 scenario 'already had sent one solution' do
    challenge = create(:challenge, title: 'Desafio 01', 
                                   description: 'Quanto é 10 + 10')
    user = create(:user)
    create(:solution, challenge: challenge, user: user)
    login_as user

    visit challenge_path(challenge)
    click_on 'Responder'
    fill_in 'Resultado', with: '20'
    click_on 'Enviar'

    expect(page).to have_content('Não foi possível cadastrar sua resposta')
    expect(page).to have_content('Usúario já respondeu')
  end
end