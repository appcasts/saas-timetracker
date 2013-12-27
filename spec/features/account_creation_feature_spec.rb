require 'spec_helper'

describe 'account creation' do
  let(:subdomain) { FactoryGirl.generate(:subdomain) }
  before(:each) { sign_up(subdomain) }

  it 'allows user to create account' do
    expect(page.current_url).to include(subdomain)
    expect(Account.all.count).to eq(1)
  end

  it 'allows access of subdomain' do
    visit root_url(subdomain: subdomain)
    expect(page.current_url).to include(subdomain)
  end

  it 'allows account followup creation' do
    subdomain2 = "#{subdomain}2"
    sign_up(subdomain2)
    expect(page.current_url).to include(subdomain2)
    expect(Account.all.count).to eq(2)
  end

  it 'does not allow account creation on subdomain' do
    user = User.first
    subdomain = Account.first.subdomain
    sign_user_in(user, subdomain: subdomain)
    expect { visit new_account_url(subdomain: subdomain) }.to raise_error ActionController::RoutingError
  end

  def sign_up(subdomain)
    visit root_url(subdomain: false)
    click_link 'Create Account'

    fill_in 'Name', with: 'Ryan'
    fill_in 'Email', with: 'bolandryanm@gmail.com'
    fill_in 'Password', with: 'pw'
    fill_in 'Password confirmation', with: 'pw'
    fill_in 'Subdomain', with: subdomain
    click_button 'Create Account'
  end
end