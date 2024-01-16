class CampaignsController < ApplicationController
  before_action :authenticate_user!
  def index 
    @campaigns = current_user.campaigns
  end
end 