require 'rails_helper'

RSpec.describe 'User updates a region', type: :feature do
  before(:each) do
    @user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    login_as(@user, scope: :user)
    @campaign1 = @user.campaigns.create!(name: 'name 1', description: 'description 1')
    @region1 = @campaign1.regions.create!(name: 'The Shire')
    @region2 = @campaign1.regions.create!(name: 'Icewind Dale')
  end
  describe 'a user goes to a campaign' do
    scenario 'within a campaign a user updates a region' do
      visit campaign_path(@campaign1)

      click_link "Update #{@region1.name}"

      expect(current_path).to eq(edit_campaign_region_path(@campaign1, @region1))

      fill_in 'Name', with: 'Mordor'

      click_on 'Update'

      expect(current_path).to eq(campaign_path(@campaign1))
      expect(page).to have_content('Region was successfully updated.')
      expect(page).to have_content('Mordor')
    end
  end
end