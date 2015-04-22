require 'rails_helper'

describe Api::UsersController do
  let!(:industry){Industry.create(name: "Tech")}
  let!(:user){User.create(name: 'Rayan', email: "rayanbouts@gmail.com", provider: "test", uid: "test", oauth_token: "test", location: "San Francisco", industry_id: industry.id, job: "Web Dev", oauth_expires_at: Time.new())}


  describe 'GET USERS' do

    it 'has an index that renders a json of all the users' do
      expected = {users: [{id: user.id, name: user.name, email: user.email,job: user.job, location: user.location, industry: {id: industry.id, name: industry.name} }], currentUser: nil}.to_json
      get :index, {industryIds: [industry.id].to_json}
      expect(response.body).to eq(expected)
    end

    it 'has a show page that renders one user object' do
      expected = {user: {id: user.id, name: user.name, email: user.email,job: user.job, location: user.location, industry: {id: industry.id, name: industry.name}}, currentUser: nil}.to_json
      get :show, {id: user.id}
      expect(response.body).to eq(expected)
    end

  end

  describe 'Login Signup' do

    xit 'has a new page that lets you signup with linkedin' do
      get :new
      expect(response.body).to include("Linkedin signup all the time")
    end

    xit 'has a create route that redirects to user news feed if user exists' do
      post :create, {email: user.email}
      expect(response.body).to include("redirect to news feed")
    end

    xit 'has a create route that redirects to edit profile if user doesnt exist' do
      post :create, {email: "bouts@gmail.com"}
      new_user = User.find_by(email: "bouts@gmail.com")
      expect(response.body).to include("redirect to edit page")
    end

  end

  describe "PUT DELETE" do

    it 'has an edit page, which is redirected from the signup' do
      get :edit, {id: user.id}
      expect(response.body).to include("Thats where golf info would be added")
    end

    it 'updates the info of a user' do
      put :update, {id: user.id}
      expect(response.body).to include("Saves in the database all golf info")
    end

    it 'lets you sign out' do
      delete :destroy, {id: user.id}
      expect(response).to be_redirect
    end

  end


end