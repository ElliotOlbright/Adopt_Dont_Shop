class AdminSheltersController < ApplicationController
  def index 
    @shelters = Shelter.order_rev
    @shelters_pending = Shelter.with_pending_applications
  end

  def show 
    @shelter = Shelter.find(params[:id])
  end 
end 