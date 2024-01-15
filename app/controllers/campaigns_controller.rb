class CampaignsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign, only: %i[ show edit update destroy ]

  # GET /campaigns or /campaigns.json
  def index
    @campaigns = Campaign.all
  end

  # GET /campaigns/1 or /campaigns/1.json
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns or /campaigns.json
  def create
    user = {user_id: current_user.id}
    new_params = campaign_params.merge(user)
    @campaign = Campaign.new(new_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to campaign_url(@campaign), notice: "Campaign was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1 or /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to campaign_url(@campaign), notice: "Campaign was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1 or /campaigns/1.json
  def destroy
    @campaign.destroy

    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: "Campaign was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_params
      params.require(:campaign).permit(:name, :description, :user_id)
    end
end
