class BetLeaguesController < ApplicationController
  before_action :set_bet_league, only: [:show, :update, :destroy]

  # GET /bet_leagues
  def index
    @bet_leagues = BetLeague.joins(:players)
                            .where(players: { id: params[:player_id] })

    render json: @bet_leagues
  end

  # GET /bet_leagues/1
  def show
    service = BetLeaguesService.new(@bet_league)
    render json: { bet_league: @bet_league, player_scores: service.player_scores, rounds: service.rounds }
  end

  # POST /bet_leagues
  def create
    @bet_league = BetLeague.new(bet_league_params)
    @bet_league.status_id = BetLeague.statuses[:active]

    if @bet_league.save
      render json: @bet_league, status: :created, location: @bet_league
    else
      render json: @bet_league.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bet_leagues/1
  def update
    if @bet_league.update(bet_league_params)
      render json: @bet_league
    else
      render json: @bet_league.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bet_leagues/1
  def destroy
    @bet_league.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet_league
      @bet_league = BetLeague.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bet_league_params
      params.require(:bet_league).permit(:name, :owner_id)
    end
end
