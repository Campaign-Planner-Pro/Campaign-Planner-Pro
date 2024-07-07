require 'rails_helper'

RSpec.describe 'User creates a new poi', type: :feature do
  before(:each) do
    @user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    login_as(@user, scope: :user)
    @campaign = @user.campaigns.create!(name: 'name 1', description: 'description 1')
    @region = @campaign.regions.create!(name:"The Shire")
  end

  describe 'a user creates a campaign' do
    xscenario 'within a region a user creates a new settlement' do
      visit campaign_path(@campaign)

      click_link 'Create new Point of interest in The Shire'

      expect(current_path).to eq(new_campaign_region_settlement_path(@campaign, @region))

      fill_in 'Name', with: 'Hobbiton'
      fill_in 'Size', with: 'village'
      fill_in 'Government', with: 'Just Vibes'
      fill_in 'Atmosphere', with: 'Chill hobbits smoking pipeweed.'

      click_button 'Create Settlement'
      
      expect(current_path).to eq(campaign_path(@campaign))
      expect(page).to have_content('Settlement was successfully created.')

      settlement = Settlement.find_by(name: 'Hobbiton')

      expect(page).to have_content('Hobbiton')
    end
  end
end