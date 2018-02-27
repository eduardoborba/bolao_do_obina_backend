class PlayerBetLeaguesController < ApplicationController
  before_action :set_player_bet_league, only: [:show, :update, :destroy]

  # GET /player_bet_leagues
  def index
    @player_bet_leagues = PlayerBetLeague.all

    render json: @player_bet_leagues
  end

  # GET /player_bet_leagues/1
  def show
    render json: @player_bet_league
  end

  # POST /player_bet_leagues
  def create
    @player_bet_league = PlayerBetLeague.new(player_bet_league_params)

    if @player_bet_league.save
      render json: @player_bet_league, status: :created, location: @player_bet_league
    else
      render json: @player_bet_league.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /player_bet_leagues/1
  def update
    if @player_bet_league.update(player_bet_league_params)
      render json: @player_bet_league
    else
      render json: @player_bet_league.errors, status: :unprocessable_entity
    end
  end

  # DELETE /player_bet_leagues/1
  def destroy
    @player_bet_league.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_bet_league
      @player_bet_league = PlayerBetLeague.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_bet_league_params
      params.require(:player_bet_league).permit(:player_id, :bet_league_id, :player_accumulated_score)
    end
end
