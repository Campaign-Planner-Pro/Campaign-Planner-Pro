require 'rails_helper'

RSpec.describe 'User updates a player character', type: :feature do
  before(:each) do
    @user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    login_as(@user, scope: :user)
    @campaign1 = @user.campaigns.create!(name: 'name 1', description: 'description 1')
    @pc1 = @campaign1.player_characters.create!(name: 'Snoop Doggg',
                                                    background: 'Hes basically a bard, but with a lot of weed.')
    @pc2 = @campaign1.player_characters.create!(name: 'Ice Cube',
                                                    background: 'this one goes to church. he still smokes weed though.')
  end
  describe 'a user goes to a campaign' do
    scenario 'within a campaign a user updates a player character' do
      visit campaign_path(@campaign1)

      click_link "Update #{@pc1.name}"

      expect(current_path).to eq(edit_campaign_player_character_path(@campaign1, @pc1))

      fill_in 'Name', with: 'Snoop Dog'

      click_on 'Update'

      expect(current_path).to eq(campaign_path(@campaign1))
      expect(page).to have_content('Player Character was successfully updated.')
      expect(page).to have_content('Snoop Dog')
    end
  end
end
