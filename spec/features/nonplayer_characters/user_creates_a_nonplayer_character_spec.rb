require 'rails_helper'

RSpec.describe 'User creates a new nonplayer character', type: :feature do
  before(:each) do
    @user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    login_as(@user, scope: :user)
    @campaign1 = @user.campaigns.create!(name: 'name 1', description: 'description 1')
  end

  describe 'a user creates a campaign' do
    scenario 'within a campaign a user creates a new nonplayer character' do
      visit campaign_path(@campaign1)

      click_link 'Create New NPC'

      expect(current_path).to eq(new_campaign_nonplayer_character_path(@campaign1))

      fill_in 'Name', with: 'Snoop Doggg'
      fill_in 'Background', with: 'Hes basically a bard, but with a lot of weed.'

      click_button 'Create'

      expect(current_path).to eq(campaign_path(@campaign1))
      expect(page).to have_content('Nonplayer Character was successfully created.')

      npc = NonplayerCharacter.find_by(name: 'Snoop Doggg')
      expect(npc.background).to eq('Hes basically a bard, but with a lot of weed.')
      expect(page).to have_content('Snoop Doggg')
    end
  end
end
