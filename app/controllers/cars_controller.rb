class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      flash[:notice] = "Car has been added!"

      redirect_to cars_path
    else
      flash.now[:notice] = "There were errors in your submission"
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:color, :mileage, :year, :description, :manufacturer_id)
  end
end
