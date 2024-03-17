require "rails_helper"

describe PlayerCharacter, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:background)}
  end
end