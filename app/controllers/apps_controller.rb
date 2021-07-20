class AppsController < ApplicationController
  def index 
  end  

  def new 
  end 

  def create
    app = Application.new(app_params)
    if app.save
      redirect_to "/admin/applications/#{app.id}"
    else
      redirect_to "/apps/new"
      flash[:alert] = "Don't Be Silly! Please Fill Out All Required Fields!"
    end 
  end

  def update 
    @pa = PetApplication.create(
                                pet_id:(params[:pet_id]),
                                application_id:(params[:id])
    )
    redirect_to "/admin/applications/#{params[:id]}"
  end

  private

  def app_params
    params.permit(
      :name,
      :street,
      :city,
      :state,
      :zip_code,
      :description,
      :pet_id
    )
  end
end 