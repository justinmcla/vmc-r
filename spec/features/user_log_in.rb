require 'rails_helper'

feature 'LOG IN' do

  context 'complete form - valid credentials' do

    it 'logs the user in and redirects them to the home page' do 

      User.create(name: 'Test User', email: 'mail@mail.com', password: 'password')

      visit '/'
      fill_in 'email', with: 'mail@mail.com'
      fill_in 'password', with: 'password'
      click_on 'Log In'

      expect(page).to have_http_status(:success)
      expect(page).to have_current_path(admin_path)

    end

  end

  context 'complete form - invalid credentials' do

    it 'redirects the form to the landing page' do 

      visit '/'
      fill_in 'email', with: 'no@mail.com'
      fill_in 'password', with: 'nopassword'
      click_on 'Log In'

      expect(page).to have_http_status(:success)
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('Invalid email/password')

    end

  end

  context 'complete form - valid, but used omniauth' do

    it 'redirects the form to the landing page' do

      User.create(name: 'Test User', email: 'mail@mail.com', password: 'password', google_uid: '12345' )

      visit '/'
      fill_in 'email', with: 'mail@mail.com'
      fill_in 'password', with: 'password'
      click_on 'Log In'

      expect(page).to have_http_status(:success)
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('created with Google')

    end

  end

end