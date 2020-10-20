require 'rails_helper'

feature 'SIGN UP' do

  context 'complete form - no missing data' do

    it 'redirects the user to the home page' do

      visit '/'
      fill_in 'user[name]', with: 'Test User'
      fill_in 'user[email]', with: 'mail@mail.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_on 'Sign Up'

      expect(page).to have_http_status(:success)
      expect(page).to have_current_path(admin_path)

    end

  end

  context 'complete form - email already in use' do

    it 'redirects the user back to the landing page' do

      User.create(name: 'Test User', email: 'mail@mail.com', password: 'password')

      visit '/'
      fill_in 'user[name]', with: 'Test User'
      fill_in 'user[email]', with: 'mail@mail.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_on 'Sign Up'

      expect(page).to have_http_status(:success)
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('already been taken')

    end

  end

  context 'incomplete form' do

    it 'redirects the user back to the landing page' do

      visit '/'
      click_on 'Sign Up'

      expect(page).to have_http_status(:success)
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('can\'t be blank')

    end
    
  end

end