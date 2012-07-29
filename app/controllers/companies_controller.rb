class CompaniesController < ApplicationController
  respond_to :json
  
  def index
    companies = Company.all
    respond_with companies
    logger.info companies.inspect
  end
end