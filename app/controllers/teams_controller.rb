class TeamsController < ApplicationController
  def index
    @teams = Team.all.order(:conference, :division, :name)
  end

  def show
    @team = Team.find(params[:id])
    @players = @team.players.order(:last_name)
  end
end