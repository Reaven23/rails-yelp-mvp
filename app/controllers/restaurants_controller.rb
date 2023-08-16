class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(resto_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new,  status: :unprocessable_entity
    end
  end

  private

  def resto_params
    params.require(:restaurant).permit(:name, :category, :address, :phone_number)
  end
end
