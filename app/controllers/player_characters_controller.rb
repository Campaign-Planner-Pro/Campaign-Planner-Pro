class PlayerCharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign, only: %I[new create destroy edit update]

  def new
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

  def edit
    @player_character = PlayerCharacter.find(params[:id])
  end

  def update
    player_character = PlayerCharacter.find(params[:id])

    if player_character.update(player_character_params)
      redirect_to campaign_path(@campaign)
      flash[:notice] = 'Player Character was successfully updated.'
    else
      render :edit
    end
  end

  private

  def player_character_params
    params.require(:player_character).permit(:name, :background)
  end

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
