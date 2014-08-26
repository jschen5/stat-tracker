require 'spec_helper'
require 'rails_helper'

describe UsersController do

  before :each do
    @user = FactoryGirl.create(:user)
  end


  describe "login" do

    it "should login a user who exists on the db" do
      User.stub(:find_by_email).and_return(@user)
      post :login, email: "jasonschen5@gmail.com", password: "thisismorethaneight"
      expect(response.body).to include("true", "Test Guy", "jasonschen5@gmail.com")
      expect(cookies.signed[:user_c]).to eq(1)
    end

  end

end