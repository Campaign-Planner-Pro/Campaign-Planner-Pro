class CampaignsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign, only: [:show, :destroy, :edit, :update]
  def index 
    @campaigns = current_user.campaigns
  end

  def show
  end

  def new
    @user = current_user
    @campaign = Campaign.new
  end

  def create    
    @campaign = Campaign.new(campaign_params)
    @campaign.user_id = current_user.id
    @campaign.save
    redirect_to campaign_path(@campaign)
  end
  
  def destroy
    @campaign.destroy
    redirect_to campaigns_path
  end

  def edit

  end

  def update
    @campaign.update(campaign_params)

    redirect_to campaign_path(@campaign)
  end

  private
    def campaign_params
      params.require(:campaign).permit(:name, :description)
    end

    def set_campaign
      @campaign = Campaign.find(params[:id])
    end
end 