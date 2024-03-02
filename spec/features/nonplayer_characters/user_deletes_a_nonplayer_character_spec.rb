require 'rails_helper'

RSpec.describe 'User deletes a nonplayer character', type: :feature do
  before(:each) do
    @user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    login_as(@user, scope: :user)
    @campaign1 = @user.campaigns.create!(name: 'name 1', description: 'description 1')
    @npc1 = @campaign1.nonplayer_characters.create!(name: 'Snoop Doggg',
                                                    background: 'Hes basically a bard, but with a lot of weed.')
    @npc2 = @campaign1.nonplayer_characters.create!(name: 'Ice Cube',
                                                    background: 'this one goes to church. he still smokes weed though.')
  end
  describe 'a user goes to a campaign' do
    scenario 'within a campaign a user deletes a nonplayer character' do
      visit campaign_path(@campaign1)

      click_button "Delete #{@npc1.name}"

      expect(current_path).to eq(campaign_path(@campaign1))
      expect(page).to have_content('Nonplayer Character was successfully deleted.')
      expect(page).to_not have_content('Snoop Doggg')
      expect(page).to have_content('Ice Cube')
    end
  end
end
