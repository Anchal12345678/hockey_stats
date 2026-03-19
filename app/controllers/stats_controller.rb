class StatsController < ApplicationController
  def index
    @stats = Stat.includes(player: :team).order(points: :desc)
    @stats = @stats.page(params[:page]).per(25)
  end
end