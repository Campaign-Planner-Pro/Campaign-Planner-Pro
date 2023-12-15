require 'rails_helper'

RSpec.describe 'user sees login' do
    describe 'they visit /users/new' do
        it "shows registration form" do
            visit '/users/new'
            save_and_open_page
            expect(page).to have_field("username")
            expect(page).to have_field("email")
            expect(page).to have_field("password")
            expect(page).to have_field("password confirmation")
        end
    end
end