require "spec_helper"

describe "Treasure management" do

  it "creates a new treasure and redirects to it" do
    get "/treasures/new"
    expect(response).to render_template(:new)

    treasure_name = "Test treasure"
    post "/treasures", treasure: {name: treasure_name}
    expect(response).to redirect_to(assigns(:treasure))
    
    follow_redirect!

    expect(response).to render_template(:index)
    expect(response.body).to include("Treasure: #{treasure_name}")
  end

  it "doesn't create anything and shows form again" do
    get "/treasures/new"
    expect(response).to render_template(:new)

    post "/treasures"
    expect(response).to render_template(:new)
  end

end