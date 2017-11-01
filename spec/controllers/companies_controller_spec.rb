require 'spec_helper'
require 'rails_helper'

describe CompaniesController do

  describe "create action" do
    before :each do
      @company_params = {"address"=>"University of Iowa", "default_currency"=>"USD", "email"=>"jeff@joe.com",
                         "name"=>"Joe place", "phone_number"=>"001 234 567 8999",
                         "start_date"=>"1/1/2017"}
      @savedCompany = double('Company', :id=> 100,
                             "address"=>"University of Iowa", "default_currency"=>"USD",
                             "email"=>"jeff@joe.com", "name"=>"Joe place",
                             "phone_number"=>"001 234 567 8999",
                             "start_date"=>"1/1/2017")
    end
    it 'should call the model method create' do
      expect(Company).to receive(:create).with(@company_params).and_return (@savedCompany)
      post :create, :params => {:company => @company_params}
    end

    it 'should return json response'  do
      allow(Company).to receive(:create).with(@company_params).and_return (@savedCompany)
      post :create, :params => {:company => @company_params}
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:ok)
      puts response
    end
  end
end