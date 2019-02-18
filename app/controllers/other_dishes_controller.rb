class OtherDishesController < ApplicationController
  before_action :set_other_dish, only: [:show, :update, :destroy]

  # GET /other_dishes
  def index
    @other_dishes = OtherDish.all

    render json: @other_dishes
  end

  # GET /other_dishes/1
  def show
    render json: @other_dish
  end

  # POST /other_dishes
  def create
    @other_dish = OtherDish.new(other_dish_params)

    if @other_dish.save
      render json: @other_dish, status: :created, location: @other_dish
    else
      render json: @other_dish.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /other_dishes/1
  def update
    if @other_dish.update(other_dish_params)
      render json: @other_dish
    else
      render json: @other_dish.errors, status: :unprocessable_entity
    end
  end

  # DELETE /other_dishes/1
  def destroy
    @other_dish.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_dish
      @other_dish = OtherDish.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def other_dish_params
      params.permit(:name)
    end
end
