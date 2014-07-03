class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      flash[:notice] = "Manufacturer added!"
      redirect_to manufacturers_path
    else
      flash.now[:notice] = "There were errors in your submission"
      render :new
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:country, :name)
  end
end
