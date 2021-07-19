class AppsController < ApplicationController
  def index 
  end  

  def new 
  end 

  def create
    @app = Application.create(
                            name:params[:name],
                            street:params[:street],
                            city:params[:city],
                            state:params[:state],
                            zip_code:params[:zip_code],
                            description:params[:description],
                          )
    redirect_to "/admin/applications/#{@app.id}"
  end
end 