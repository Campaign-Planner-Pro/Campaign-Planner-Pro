class SettlementsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_campaign_and_region, only: %I[new create destroy edit update]
  
    def new
      @settlement = @region.settlements.new
    end
  
    def create
      @settlement = @region.settlements.new(settlement_params)
  
      if @settlement.save
        redirect_to campaign_path(@campaign.id)
        flash[:notice] = 'Settlement was successfully created.'
      else
        render :new
      end
    end
  
    def destroy
      settlement = Settlement.find(params[:id])
      settlement.destroy
      flash[:notice] = 'Settlement was successfully deleted.'
      redirect_to region_path(@region)
    end
  
    def edit
      @settlement = Settlement.find(params[:id])
    end
  
    def update
      settlement = Settlement.find(params[:id])
  
      if settlement.update(settlement_params)
        redirect_to region_path(@region)
        flash[:notice] = 'Settlement was successfully updated.'
      else
        render :edit
      end
    end

    private

    def settlement_params
      params.require(:settlement).permit(:name, :size, :government, :atmosphere)
    end
  
    def set_campaign_and_region
      @campaign = Campaign.find(params[:campaign_id]) 
      @region = Region.find(params[:region_id])
    end
end    