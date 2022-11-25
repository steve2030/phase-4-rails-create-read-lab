class PlantsController < ApplicationController
  def index
    plants=Plant.all
    render json:plants
  end
  def show
    plant=Plant.find(params[:id])
    render json:plant
  end
  def create
    plant=Plant.create(plant_params)
    if plant
      render json:plant, status: :created
    else
      render json:{error:"the plant not created"}, status: :not_created
    end

  end
  private
  def plant_params
    params.permit([:name,:image,:price])
  end

end
