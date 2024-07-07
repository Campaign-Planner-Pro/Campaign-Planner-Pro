require 'rails_helper'

RSpec.describe InterestPoint, type: :model do
  before(:each) do
    @user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    login_as(@user, scope: :user)
    @campaign = @user.campaigns.create!(name: 'name 1', description: 'description 1')
    @region = @campaign.regions.create!(name:"The Shire")
    @settlement = @region.settlements.create!(name: 'Small Town', size: "Village", government: "Cool", atmosphere: "Chill")
  end

  describe "relationships" do
    scenario "points of interest belong to settlment and region" do
      region_point = @region.interest_points.create!(name: 'Mountain Peak')
      settlement_point = @settlement.interest_points.create!(name: 'Local Museum')
      expect(@region.all_interest_points).to eq([region_point, settlement_point])
      expect(@settlement.interest_points).to eq([settlement_point])
    end
  end  
end
