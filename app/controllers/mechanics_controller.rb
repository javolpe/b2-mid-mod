class MechanicsController < ApplicationController 
  def index 
    @mechanics = Mechanic.all
    @average_experience = @mechanics.average(:years_experience).to_i
  end
end