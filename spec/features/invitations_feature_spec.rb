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

  it 'validates email' do
    fill_in 'Email', with: 'wrong'
    click_button 'Invite User'
    expect(page).to have_content 'Send Invitation'
    expect(page).to have_content 'invalid'
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

    context 'user accepts invitation' do
      before do
        click_link 'Sign out'

        open_email 'ryan@tanookilabs.com'
        visit_in_email 'Accept invitation'

        fill_in 'Name', with: 'Ryan Boland'
        fill_in 'Password', with: 'pw'
        fill_in 'Password confirmation', with: 'pw'
        click_button 'Create Account'
      end

      it 'confirms account creation' do
        expect(page).to have_content 'Your account was created successfully'
      end

      it 'shows a checkmark on the users page' do
        visit users_path
        within('tr', text: 'Ryan Boland') do
          expect(page).to have_selector '.glyphicon-ok'
        end
      end
    end
  end
end