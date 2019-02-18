class CheesesController < ApplicationController
  before_action :set_cheese, only: [:show]

  # GET /cheeses
  def index
    @cheeses = Cheese.all

    render json: @cheeses
  end

  # GET /cheeses/1
  def show
    render json: @cheese
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cheese
      @cheese = Cheese.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cheese_params
      params.permit(:name)
    end
end
