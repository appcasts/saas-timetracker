require 'spec_helper'

describe 'account creation' do
  it 'allows user to create account' do
    visit root_path
    click_link 'Create Account'

    fill_in 'Name', with: 'Ryan'
    fill_in 'Email', with: 'bolandryanm@gmail.com'
    fill_in 'Password', with: 'pw'
    fill_in 'Password Confirmation', with: 'pw'
    fill_in 'Subdomain', with: 'test_subdomain'
    click_button 'Create Account'

    expect(page).to have_content('Signed up successfully')
  end
end