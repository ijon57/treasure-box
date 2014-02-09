require "spec_helper"

describe "User session" do

  it "authenticates user and redirects to homepage" do
    get "/sessions/new"
    expect(response).to render_template(:new)

    email = "user@mail.test"
    password = "secretpassword"
    post "/sessions", email: email, password: password
    expect(response).to redirect_to(root_url)
    
    follow_redirect!

    expect(response).to render_template(:index)
    expect(response.body).to include("User successfully authenticated")
    expect(response.body).to include("Logged in as: #{email}")
  end

  it "cannot authenticate user and shows login form again" do
    get "/sessions/new"
    expect(response).to render_template(:new)
    post "/sessions"
    expect(response).to render_template(:new)
  end

end