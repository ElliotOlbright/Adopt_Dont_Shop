class AdminApplicationsController < ApplicationController
  def index 
    @applications = Application.all
  end 

  def show 
    @app = Application.find(params[:id])
  end 
end 