require 'rails_helper'

RSpec.describe 'User creates a new region', type: :feature do
  before(:each) do
    @user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    login_as(@user, scope: :user)
    @campaign1 = @user.campaigns.create!(name: 'name 1', description: 'description 1')
  end

  describe 'a user creates a campaign' do
    scenario 'within a campaign a user creates a new region' do
      visit campaign_path(@campaign1)

      click_link 'New Region'

      expect(current_path).to eq(new_campaign_region_path(@campaign1))

      fill_in 'Name', with: 'The Shire'

      click_button 'Create'

      expect(current_path).to eq(campaign_path(@campaign1))
      expect(page).to have_content('Region was successfully created.')

      expect(page).to have_content('The Shire')
    end
  end
end