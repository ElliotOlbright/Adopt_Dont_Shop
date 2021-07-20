class AdminApplicationsController < ApplicationController
  def index 
    @applications = Application.all
    
  end 

  def show 
    @app = Application.find(params[:id])
    if params[:search_by_name].present?
      @pets = Pet.where("lower(name) like ?", "%#{params[:search_by_name].downcase}%")
    else
      @pets = []
    end
  end 
end 