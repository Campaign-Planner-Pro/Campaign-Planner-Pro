require "rails_helper"

describe Settlement, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:size)}
    it {should validate_presence_of(:government)}
    it {should validate_presence_of(:atmosphere)}
  end  
end