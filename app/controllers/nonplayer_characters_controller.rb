class NonplayerCharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign, only: [:new, :create, :destroy, :edit, :update]

  def new
    @nonplayer_character = @campaign.nonplayer_characters.new
  end

  def create
    @nonplayer_character = @campaign.nonplayer_characters.new(nonplayer_character_params)

    if @nonplayer_character.save
      redirect_to campaign_path(@nonplayer_character.campaign_id)
      flash[:notice] = 'Nonplayer Character was successfully created.'
    else
      render :new
    end
  end

  def destroy
    nonplayer_character = NonplayerCharacter.find(params[:id])
    nonplayer_character.destroy
    flash[:notice] = 'Nonplayer Character was successfully deleted.'
    redirect_to campaign_path(@campaign)
  end

  def edit
    @nonplayer_character = NonplayerCharacter.find(params[:id])
  end

  def update
    nonplayer_character = NonplayerCharacter.find(params[:id])

    if nonplayer_character.update(nonplayer_character_params)
      redirect_to campaign_path(@campaign)
      flash[:notice] = 'Nonplayer Character was successfully updated.'
    else
      render :edit
    end
  end

  private

  def nonplayer_character_params
    params.require(:nonplayer_character).permit(:name, :background)
  end

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
