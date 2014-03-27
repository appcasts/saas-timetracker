require 'spec_helper'

describe 'invitations' do
  let!(:account) { create(:account_with_schema) }
  let(:user) { account.owner }

  before { set_subdomain(account.subdomain) }

  it 'shows the owner in the authorized users list' do
    sign_user_in(user)
    visit users_path
    expect(page).to have_content user.name
    expect(page).to have_content user.email
    expect(page).to have_selector '.glyphicon-ok'
  end
end