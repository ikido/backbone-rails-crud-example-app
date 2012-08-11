class CompaniesController < ApplicationController
  respond_to :json
  
  def index
    respond_with Company.all
  end
  
  def create
    respond_with Company.create(params[:company])
  end
  
  def update
    respond_with Company.update(params[:id], params[:company])
  end
  
  def destroy
    respond_with Company.destroy(params[:id])
  end

end