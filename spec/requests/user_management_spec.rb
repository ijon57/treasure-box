require "spec_helper"

describe "User management" do

  it "creates user and redirects to user's page" do
    get "/users/new"
    expect(response).to render_template(:new)

    email = "user@mail.test"
    password = "secretpassword"
    post "/users", user: {email: email, password: password}
    expect(response).to redirect_to(assigns(:user))
    
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include("User successfully created")
  end

end