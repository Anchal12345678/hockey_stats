class PlayersController < ApplicationController
  def index
    @players = Player.includes(:team).order(:last_name)
    if params[:search].present?
      @players = @players.where(
        "first_name LIKE ? OR last_name LIKE ? OR nationality LIKE ? OR position LIKE ?",
        "%#{params[:search]}%",
        "%#{params[:search]}%",
        "%#{params[:search]}%",
        "%#{params[:search]}%"
      )
    end
    if params[:team_id].present?
      @players = @players.where(team_id: params[:team_id])
    end
    @players = @players.page(params[:page]).per(20)
  end

  def show
    @player = Player.find(params[:id])
    @stats = @player.stats.order(:season)
  end
end