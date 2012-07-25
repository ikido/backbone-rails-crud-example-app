class MainController < ApplicationController
  def index
    @companies = Company.all
  end
end