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

  def update 
    if params[:status] == 'approved'
      @app = Application.find(params[:id])
      @pa = @app.find_pet_app(params[:pet_id])
      @pa = PetApplication.update(status: 'Approved')
      redirect_to "/admin/applications/#{@app.id}"
    else 
      @app = Application.find(params[:id])
      @pa = @app.find_pet_app(params[:pet_id])
      @pa = PetApplication.update(status: 'Rejected')
      redirect_to "/admin/applications/#{@app.id}"
    end 
  end
end