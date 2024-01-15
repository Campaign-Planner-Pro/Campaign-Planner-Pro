require 'rails_helper'

RSpec.describe "campaigns/edit", type: :view do
  let(:campaign) {
    Campaign.create!(
      name: "MyString",
      description: "MyText",
      user: nil
    )
  }

  before(:each) do
    assign(:campaign, campaign)
  end

  it "renders the edit campaign form" do
    render

    assert_select "form[action=?][method=?]", campaign_path(campaign), "post" do

      assert_select "input[name=?]", "campaign[name]"

      assert_select "textarea[name=?]", "campaign[description]"

      assert_select "input[name=?]", "campaign[user_id]"
    end
  end
end
