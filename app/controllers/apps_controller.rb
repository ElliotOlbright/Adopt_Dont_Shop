class AppsController < ApplicationController
  def index 
  end  

  def new 
  end 

  def show 
    @app = Application.find(params[:id])
    if params[:search_by_name].present?
      @pets = Pet.where("lower(name) like ?", "%#{params[:search_by_name].downcase}%")
    else
      @pets = []
    end
  end 

  def create
    @app = Application.new(app_params)
    if @app.save
      redirect_to "/apps/#{@app.id}"
    else
      redirect_to "/apps/new"
      flash[:alert] = "Don't Be Silly! Please Fill Out All Required Fields!"
    end 
  end

  def update 
    if params[:description].present?
      @application = Application.find(params[:id])
      @application.update({ 
        description: params[:description],
        application_status: 'Pending'
      })
      redirect_to "/apps/#{params[:id]}"
    else
    @pa = PetApplication.create(
                                pet_id:(params[:pet_id]),
                                application_id:(params[:id])
    )
    redirect_to "/apps/#{params[:id]}"
    end 
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