require 'rails_helper'

RSpec.describe 'User creates a new nonplayer character' do
  before(:each) do
    @user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    login_as(@user, scope: :user)
    @campaign1 = Campaign.create!(user: @user, name: 'name 1', description: 'description 1')
  end

  scenario 'a user creates a nonplayer character' do
    visit campaigns_path

    click_link 'Create New Nonplayer Character'

    expect(current_path).to eq(new_nonplayer_character_path)

    fill_in :name, with: 'Snoop Doggg'
    fill_in :background, with: 'ambient background'

    click_button 'Create new Nonplayer Character'

    expect(NonplayerCharacters.last.name).to eq('Snoop Doggg')
    expect(NonplayerCharacters.last.background).to eq('ambient Background')
  end
end
