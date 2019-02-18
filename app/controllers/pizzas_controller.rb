class PizzasController < ApplicationController
  before_action :set_pizza, only: [:show, :update, :destroy]

  # GET /pizzas
  def index
    @pizzas = Pizza.all

    render json: @pizzas
  end

  # GET /pizzas/1
  def show
    render json: @pizza
  end

  # POST /pizzas
  def create
    @pizza = Pizza.new(pizza_params)

    if @pizza.save
      render json: @pizza, status: :created, location: @pizza
    else
      render json: @pizza.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pizzas/1
  def update
    if @pizza.update(pizza_params)
      render json: @pizza
    else
      render json: @pizza.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pizzas/1
  def destroy
    @pizza.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pizza
      @pizza = Pizza.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pizza_params
      params.permit(:cheese_id, :crust_id, :pizza_type_id, :sauce_id, :size_id)
    end
end
