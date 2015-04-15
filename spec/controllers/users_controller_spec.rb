require 'rails_helper'

describe UsersController do
  let!(:user){User.create(email: "rayanbouts@gmail.com")}

  it 'has an index that renders a json of all the users' do
    get :index
    expect(response.body).to include("I am a json object that returns all users")
  end

  it 'has a show page that renders one user object' do
    get :show, {id: user.id}
    expect(response.body).to include("I am a single user")
  end

  it 'has a new page that lets you signup with linkedin' do
    get :new
    expect(response.body).to include("Linkedin signup all the time")
  end

  it 'has a create route that redirects to user news feed if user exists' do
    post :create, {email: user.email}
    expect(response.body).to include("redirect to news feed")
  end

  it 'has a create route that redirects to edit profile if user doesnt exist' do
    post :create, {email: "bouts@gmail.com"}
    new_user = User.find_by(email: "bouts@gmail.com")
    expect(response.body).to include("redirect to edit page")
  end

  it 'has an edit page, which is redirected from the signup' do
    get :edit, {id: user.id}
    expect(response.body).to include("Thats where golf info would be added")
  end

  it 'lets you choose your golf info' do
    get :update, {id: user.id}
    expect(response.body).to include("Saves in the database all golf info")
  end

  it 'lets you delete yourself' do
  end


end