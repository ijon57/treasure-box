require "spec_helper"

describe "Welcome page" do

  it "shows index page" do
    get "/"
    expect(response).to render_template(:index)
  end

end