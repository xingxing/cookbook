require 'spec_helper'

RSpec.describe Cookbooks::API  do

  def app
    Cookbooks::API
  end

  describe "GET" do
    
    before(:each) do
      create(:cookbook)
    end

    it "list all cookbook order by c_at" do
      get "/cookbooks"
      expect(last_response.status).to eq 200
      expect(last_response.body).to eq({})
    end

  end


end
