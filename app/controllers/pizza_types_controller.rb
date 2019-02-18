class PizzaTypesController < ApplicationController
  before_action :set_pizza_type, only: [:show, :update, :destroy]

  # GET /pizza_types
  def index
    @pizza_types = PizzaType.all

    render json: @pizza_types
  end

  # GET /pizza_types/1
  def show
    render json: @pizza_type
  end

  # POST /pizza_types
  def create
    @pizza_type = PizzaType.new(pizza_type_params)

    if @pizza_type.save!
      render json: @pizza_type, status: :created, location: @pizza_type
    else
      render json: @pizza_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pizza_types/1
  def update
    if @pizza_type.update!(pizza_type_params)
      render json: @pizza_type
    else
      render json: @pizza_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pizza_types/1
  def destroy
    @pizza_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pizza_type
      @pizza_type = PizzaType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pizza_type_params
      params.permit(:name)
    end
end
