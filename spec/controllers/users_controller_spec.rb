require 'rails_helper'

describe UsersController, :type => :controller do
  
  before do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
  end

  describe "GET #show" do
    context "User is logged in" do
      before do
        sign_in @user    
      end

      it "loads correct user details" do
        get :show, id: @user.id
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end

    end

    context "No user is logged in" do
      it "redirects to login" do
        get :show, id: @user.id
        expect(response).to redirect_to(root_path)
      end
    end

    context "User can't access another user's show page" do
      before do
        sign_in @user
      end

      it "redirects to root_path" do
        get :show, id: @user2.id
        expect(response).to redirect_to(root_path)
      end

      it "responds with HTTP 302 response code" do
        get :show, id: @user2.id
        expect(response).to have_http_status(302)
      end

    end

  end

end