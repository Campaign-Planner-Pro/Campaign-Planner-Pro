class PlayerCharactersController < ApplicationController
  before_action :set_campaign, only: [:new, :create, :destroy]

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @player_character = @campaign.player_characters.new
  end

  def create
    @player_character = @campaign.player_characters.new(player_character_params)

    if @player_character.save
      redirect_to campaign_path(@player_character.campaign_id)
      flash[:notice] = 'Player Character was successfully created.'
    else
      render :new
    end
  end

  def destroy
    player_character = PlayerCharacter.find(params[:id])
    player_character.destroy
    flash[:notice] = 'Player Character was successfully deleted.'
    redirect_to campaign_path(@campaign)
  end

  private

  def player_character_params
    params.require(:player_character).permit(:name, :background)
  end

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
