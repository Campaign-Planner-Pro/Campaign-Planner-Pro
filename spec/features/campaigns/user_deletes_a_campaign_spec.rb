require "rails_helper"

describe "user deletes an campaign" do
  describe "they link from the show page" do
    it "displays all campaigns without the deleted entry" do
        user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
        login_as(user, :scope => :user)
        campaign_1 = Campaign.create!(user: user, name: "name 1", description:"description 1")
        campaign_2 = Campaign.create!(user: user, name: "name 2", description:"description 2")

        visit campaign_path(campaign_1)
        click_link "Delete"

        expect(current_path).to eq(campaigns_path)
        expect(page).to have_content(campaign_2.name)
        expect(page).to_not have_content(campaign_1.name)
    end
  end
end