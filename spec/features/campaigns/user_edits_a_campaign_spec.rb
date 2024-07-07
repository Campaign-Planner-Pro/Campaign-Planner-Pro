require "rails_helper"

describe "user sees all their campaigns" do
    describe "they visit /campaigns" do
        it "displays all their campaigns" do
            user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
            login_as(user, :scope => :user)
            
            campaign_1 = Campaign.create!(user: user, name: "name 1", description:"description 1")
            campaign_2 = Campaign.create!(user: user, name: "name 2", description:"description 2")

            visit campaign_path(campaign_1)

            click_link "Edit Campaign"

            fill_in "campaign[name]", with: "Test Name"
            fill_in "campaign[description]", with: "Test Description"
            click_on "Update Campaign"

            expect(page).to have_content("Test Name")
            expect(page).to have_content("Test Description")
        end
    end
end