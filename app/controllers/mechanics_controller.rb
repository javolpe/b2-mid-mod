class MechanicsController < ApplicationController 
  def index 
    @mechanics = Mechanic.all
    @average_experience = @mechanics.average(:years_experience).to_i
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides.where("open = true").order(thrill_rating: :desc)
  end

  def update 
    @mechanic = Mechanic.find(params[:id])
    RideMechanic.create!(ride_id: params[:ride], mechanic_id:params[:id])
    redirect_to "/mechanics/#{@mechanic.id}"
  end
end