class RegionsController < ApplicationController
    before_action :set_campaign, only: %I[new create destroy edit update]
  
    def new
      @campaign = Campaign.find(params[:campaign_id])
      @region = @campaign.regions.new
    end
  
    def create
      @region = @campaign.regions.new(region_params)
  
      if @region.save
        redirect_to campaign_path(@region.campaign_id)
        flash[:notice] = 'Region was successfully created.'
      else
        render :new
      end
    end
  
    def destroy
      region = Region.find(params[:id])
      region.destroy
      flash[:notice] = 'Region was successfully deleted.'
      redirect_to campaign_path(@campaign)
    end
  
    def edit
      @campaign = Campaign.find(params[:campaign_id])
      @region = Region.find(params[:id])
    end
  
    def update
      campaign = Campaign.find(params[:campaign_id])
      region = Region.find(params[:id])
  
      if region.update(region_params)
        redirect_to campaign_path(campaign)
        flash[:notice] = 'Region was successfully updated.'
      else
        render :edit
      end
    end

    private

    def region_params
      params.require(:region).permit(:name)
    end
  
    def set_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end
end    