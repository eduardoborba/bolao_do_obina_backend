class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :update, :destroy]

  # GET /rounds
  def index
    @rounds = Round.all

    render json: @rounds
  end

  # GET /rounds/1
  def show
    service = RoundsService.new(@round)
    render json: { round: @round, games: service.games }
  end

  # POST /rounds
  def create
    @round = Round.new(round_params)
    @round.status_id = Round.statuses[:active]
    @round.round_number = @round.bet_league.rounds.count + 1
    service = RoundsService.new(@round)

    if @round.save && service.create!(params)
      render json: @round, status: :created, location: @round
    else
      render json: @round.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rounds/1
  def update
    service = RoundsService.new(@round)

    if @round.update(round_params) && service.update!(params)
      render json: @round
    else
      render json: @round.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rounds/1
  def destroy
    @round.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = Round.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def round_params
      params.require(:round).permit(:bet_league_id, :number_of_games, :blocked_after, :round_number, :status_id)
    end
end
