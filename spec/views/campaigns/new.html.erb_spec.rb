require 'rails_helper'

RSpec.describe "campaigns/new", type: :view do
  before(:each) do
    assign(:campaign, Campaign.new(
      name: "MyString",
      description: "MyText",
      user: nil
    ))
  end

  it "renders new campaign form" do
    render

    assert_select "form[action=?][method=?]", campaigns_path, "post" do

      assert_select "input[name=?]", "campaign[name]"

      assert_select "textarea[name=?]", "campaign[description]"

      assert_select "input[name=?]", "campaign[user_id]"
    end
  end
end
