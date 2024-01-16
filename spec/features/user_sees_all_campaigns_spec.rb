require "rails_helper"

describe "user sees all their campaigns" do
    describe "they visit /campaigns" do
        it "displays all their campaigns" do
            user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
            login_as(user, :scope => :user)
            
            campaign_1 = Campaign.create!(user: user, name: "name 1", description:"description 1")
            campaign_2 = Campaign.create!(user: user, name: "name 2", description:"description 2")

            visit '/campaigns'

            expect(page).to have_content(campaign_1.name)
            expect(page).to have_content(campaign_2.name)
        end
        it "only displays campaigns created by the user" do
            user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
            user2 = User.create!(:email => 'test2@example.com', :password => 'f4k3w0rd')
            login_as(user, :scope => :user)
            
            campaign_1 = Campaign.create!(user: user, name: "name 1", description:"description 1")
            campaign_2 = Campaign.create!(user: user, name: "name 2", description:"description 2")
            campaign_3 = Campaign.create!(user: user2, name: "name 3", description:"description 3")
            visit '/campaigns'

            expect(page).to have_content(campaign_1.name)
            expect(page).to have_content(campaign_2.name)
            expect(page).not_to have_content(campaign_3.name)

        end 
    end
end