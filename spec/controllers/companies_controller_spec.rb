# encoding: utf-8

require 'spec_helper'

describe CompaniesController do
  describe "GET index" do
    it 'responds to json requests' do
      get :index, :format => :json
      response.status.should eq 200
    end
    
    it 'gets all companies and renders them as json' do
      companies = [stub_model(Company), stub_model(Company)]
       
      Company.should_receive(:all).and_return(companies)

      get :index, :format => :json
      
      response.body.should eq companies.to_json
    end
  end
end