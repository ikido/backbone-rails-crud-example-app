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
  
  describe "POST create" do
    # 201 - Http resource created
    it 'accepts model attributes as json and returns http code 201 on success' do 
      @company = FactoryGirl.create(:company)
      Company.should_receive(:create).and_return(@company)
      
      post :create, :format => :json, :company => { :name => 'test' }
      response.status.should eq 201
    end
    
    it 'renders errors as json and return http code 422 on error with invalid attributes' do
      @company = FactoryGirl.build_stubbed(:company)
      @company.stub(:errors => {:any => 'error'})
      Company.should_receive(:create).and_return(@company)
      
      post :create, :format => :json
      response.status.should eq 422
    end
  end
  
  describe "PUT update" do
    # 204 - Success, but no content to return
    it 'accepts model attributes as json and returns http code 204 on success' do 
      @company = FactoryGirl.create(:company)
      Company.should_receive(:update).and_return(@company)
      
      put :update, :format => :json, :company => { :name => 'test' }, :id => 1
      response.status.should eq 204
    end
    
    it 'renders errors as json and return http code 422 on error with invalid attributes' do
      @company = FactoryGirl.build_stubbed(:company)
      @company.stub(:errors => {:any => 'error'})
      Company.should_receive(:update).and_return(@company)
      
      post :update, :format => :json, :id => 1
      response.status.should eq 422
    end
  end
  
  describe "DELETE destroy" do
    # 204 - Success, but no content to return
    it 'accepts model attributes as json and returns http code 204 on success' do 
      @company = FactoryGirl.create(:company)
      Company.should_receive(:destroy).and_return(@company)
      
      delete :destroy, :format => :json, :id => 1
      response.status.should eq 204
    end
    
    it 'renders errors as json and return http code 422 on error with invalid attributes' do
      @company = FactoryGirl.build_stubbed(:company)
      @company.stub(:errors => {:any => 'error'})
      Company.should_receive(:destroy).and_return(@company)
      
      delete :destroy, :format => :json, :id => 1
      response.status.should eq 422
    end
  end
end