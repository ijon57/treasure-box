require "spec_helper"

describe "User management" do

  it "creates user and redirects to homepage" do
    get "/users/new"
    expect(response).to render_template(:new)

    email = "user@mail.test"
    password = "secretpassword"
    post "/users", user: {email: email, password: password}
    expect(response).to redirect_to(root_url)
    
    follow_redirect!

    expect(response).to render_template(:index)
    expect(response.body).to include("User successfully created")
    expect(response.body).to include("Logged in as: #{email}")
  end

  it "doesn't create user and shows form again" do
    get "/users/new"
    expect(response).to render_template(:new)

    post "/users"
    expect(response).to render_template(:new)
  end

end