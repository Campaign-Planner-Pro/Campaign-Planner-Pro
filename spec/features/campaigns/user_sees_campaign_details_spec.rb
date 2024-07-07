require 'rails_helper'

describe "user sees one campaign" do
    describe "they link from the campaign index" do
        it "displays details for one campaign" do
            user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
            login_as(user, :scope => :user)
            
            campaign_1 = Campaign.create!(user: user, name: "name 1", description:"description 1")
            campaign_2 = Campaign.create!(user: user, name: "name 2", description:"description 2")

            visit campaigns_path

            click_link campaign_1.name

            expect(page).to have_content(campaign_1.name)
            expect(page).to have_content(campaign_1.description)
        end
    end
end