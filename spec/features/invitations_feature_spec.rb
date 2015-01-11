require 'spec_helper'

describe 'invitation' do
    let!(:account) { create(:account_with_schema) }
    let!(:user) { account.owner }

    before do
        set_subdomain(account.subdomain)
        sign_user_in(user)
        visit users_path
    end

    it 'shows the owner in the authorized users list'
        
        expect(page).to have_content user.name
        expect(page).to have_selector '.glyphicon-ok'
        
    end

    it 'shows inviation when user is' do
        fill_in 'Email', with: 'bencochrane1@me.com'
        click_button 'Invite User'
        expect(page).to have_content 'invitation email has been sent'
        expect(page).to have_content 'bencochrane1@me.com'
        expect(page).to have_content 'Invitation Pending'
    end

    it 'shows inviation when user is' do
        fill_in 'Email', with: 'bencochrane1@me.com'
        click_button 'Invite User'

        click_link 'Sign out'

        open_email 'bencochrane1@me.com'
        visit_in_email 'Accept invitation'

        fill_in 'Name', with: 'Ben Cochrane'
        fill_in 'Email', with: 'bencochrane1@me.com'
        fill_in 'Password', with: 'pw'
        click_button 'Create Account'

        expect(page).to have_content 'Your account was created successfully'
    end


    end

end