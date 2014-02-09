require "spec_helper"

describe "User management" do

  it "creates user and redirects to user's page" do
    email = "user@mail.test"
    password = "secretpassword"
    post "/users", email: email, password: password, password_confirmation: password
    expect(response).to redirect_to(assigns(:user))
  end

end