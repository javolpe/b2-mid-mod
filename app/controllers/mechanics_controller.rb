class MechanicsController < ApplicationController 
  def index 
    @mechanics = Mechanic.all
    @average_experience = @mechanics.average(:years_experience).to_i
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides.where("open = true").order(thrill_rating: :desc)
  end
end