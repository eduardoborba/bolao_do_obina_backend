class ChampionshipsController < ApplicationController
  before_action :set_championship, only: [:show, :update, :destroy]

  # GET /championships
  def index
    @championships = Championship.all

    render json: @championships
  end

  # GET /championships/1
  def show
    render json: @championship
  end

  # POST /championships
  def create
    @championship = Championship.new(championship_params)

    if @championship.save
      render json: @championship, status: :created, location: @championship
    else
      render json: @championship.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /championships/1
  def update
    if @championship.update(championship_params)
      render json: @championship
    else
      render json: @championship.errors, status: :unprocessable_entity
    end
  end

  # DELETE /championships/1
  def destroy
    @championship.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_championship
      @championship = Championship.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def championship_params
      params.require(:championship).permit(:name)
    end
end
