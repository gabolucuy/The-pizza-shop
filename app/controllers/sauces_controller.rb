class SaucesController < ApplicationController
  before_action :set_sauce, only: [:show]

  # GET /sauces
  def index
    @sauces = Sauce.all

    render json: @sauces
  end

  # GET /sauces/1
  def show
    render json: @sauce
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sauce
      @sauce = Sauce.find(params[:id])
    end

end
