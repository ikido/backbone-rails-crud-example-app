# encoding: utf-8

require 'spec_helper'

describe MainController do
  describe "GET index" do
    before(:all) do
      @companies = [mock_model(Company)]
    end
    
    it "gets and assigns all companies to instance var" do      
      Company.should_receive(:all).once.and_return(companies)      
      get :index
      assigns(:companies).should eq(companies)
    end
    
    it "reners index template" do
      get :index
      response.should render_template(:index)
    end
  end
end