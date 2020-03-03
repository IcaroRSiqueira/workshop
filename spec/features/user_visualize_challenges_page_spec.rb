require 'rails_helper'

feature 'User view challenges page' do
  scenario 'successfully' do
    create(:challenge, title: 'Desafio 01', 
                       description: 'Faça uma calculadora, divirta-se!')
    login_as create(:user)

    visit root_path
    click_on 'Desafios'
    
    expect(page).to have_css 'h3', text: 'Desafio 01'
    expect(page).to have_css 'p', text: 'Faça uma calculadora, divirta-se!'
  end

  scenario 'multiple challenges' do
    create(:challenge, title: 'Desafio 01', 
                       description: 'Faça uma calculadora, divirta-se!')
    create(:challenge, title: 'Desafio 02', 
                       description: 'Soma dos n primeiros números primos')
    login_as create(:user)

    visit root_path
    click_on 'Desafios'
    
    expect(page).to have_css 'h3', text: 'Desafio 01'
    expect(page).to have_css 'p', text: 'Faça uma calculadora, divirta-se!'
    expect(page).to have_css 'h3', text: 'Desafio 02'
    expect(page).to have_css 'p', text: 'Soma dos n primeiros números primos'
  end

  scenario 'dont have a challenge' do
    login_as create(:user)

    visit challenges_path

    expect(page).to have_content 'Nenhum desafio disponível no momento'
  end
end