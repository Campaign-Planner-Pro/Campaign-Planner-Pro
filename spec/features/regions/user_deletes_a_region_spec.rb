require 'rails_helper'

RSpec.describe 'User deletes a region', type: :feature do
  before(:each) do
    @user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    login_as(@user, scope: :user)
    @campaign1 = @user.campaigns.create!(name: 'name 1', description: 'description 1')
    @region1 = @campaign1.regions.create!(name: 'The Shire')
    @region2 = @campaign1.regions.create!(name: 'Icewind Dale')
  end
  describe 'a user goes to a campaign' do
    scenario 'within a campaign a user deletes a region' do
      visit campaign_path(@campaign1)

      click_link "Delete #{@region1.name}"

      expect(current_path).to eq(campaign_path(@campaign1))
      expect(page).to have_content('Region was successfully deleted.')
      expect(page).to_not have_content('The Shire')
      expect(page).to have_content('Icewind Dale')
    end
  end
end