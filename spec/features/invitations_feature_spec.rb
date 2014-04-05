require 'spec_helper'

describe 'invitations' do
  let!(:account) { create(:account_with_schema) }
  let(:user) { account.owner }

  before do
    set_subdomain(account.subdomain)
    sign_user_in(user)
    visit users_path
  end

  it 'shows the owner in the authorized users list' do
    expect(page).to have_content user.name
    expect(page).to have_content user.email
    expect(page).to have_selector '.glyphicon-ok'
  end

  describe 'when user is invited' do
    before do
      fill_in 'Email', with: 'ryan@tanookilabs.com'
      click_button 'Invite User'
    end

    it 'shows invitation' do
      expect(page).to have_content 'invitation email has been sent'
      expect(page).to have_content 'ryan@tanookilabs.com'
      expect(page).to have_content 'Invitation Pending'
    end
  end
end
