require 'rails_helper'

RSpec.describe 'User updates a nonplayer character', type: :feature do
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
    scenario 'within a campaign a user updates a nonplayer character' do
      visit campaign_path(@campaign1)

      click_button "Update #{@npc1.name}"

      expect(current_path).to eq(edit_campaign_nonplayer_character_path(@campaign1, @npc1))

      fill_in 'Name', with: 'Snoop Dog'

      click_on 'Update Nonplayer Character'

      expect(current_path).to eq(campaign_path(@campaign1))
      expect(page).to have_content('Nonplayer Character was successfully updated.')
      expect(page).to have_content('Snoop Dog')
    end
  end
end
