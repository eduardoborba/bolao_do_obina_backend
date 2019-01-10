class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]

  # GET /games
  def index
    @games = Game.eager_load(:visitor)
                 .eager_load(:home)
                 .all

    @games_json = @games.map do |game|
      {
        id: game.id,
        visitor_name: game.visitor.name,
        visitor_score: game.visitor_score,
        home_name: game.home.name,
        home_score: game.home_score
      }
    end

    render json: @games_json
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(:home_id, :visitor_id, :home_score, :visitor_score, :date_time, :championship_id, :bet_league_id, :round_id)
    end
end
