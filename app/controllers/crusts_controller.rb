class CrustsController < ApplicationController
  before_action :set_crust, only: [:show]

  # GET /crusts
  def index
    @crusts = Crust.all

    render json: @crusts
  end

  # GET /crusts/1
  def show
    render json: @crust
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crust
      @crust = Crust.find(params[:id])
    end

end
