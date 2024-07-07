require "rails_helper"

describe "user creates new campaign" do
    describe "they link from the campaign index" do
        describe "they fill in a name and description" do
            it "creates a new campaign" do
                user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
                login_as(user, :scope => :user)

                visit campaigns_path

                click_link "Create New Campaign"

                expect(current_path).to eq(new_campaign_path)

                fill_in "campaign[name]", with: "Test Name"
                fill_in "campaign[description]", with: "Test Description"
                click_on "Create Campaign"

                expect(page).to have_content("Test Name")
                expect(page).to have_content("Test Description")
            end    
        end
    end
end