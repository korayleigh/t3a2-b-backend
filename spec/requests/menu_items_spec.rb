require "rails_helper"

RSpec.describe "Menu Items", :type => :request do
  it "indexes all menu items" do
    # headers = { "ACCEPT" => "application/json" }
    get "/api/menu"
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response).to have_http_status(:ok)
    puts response.body
  end
end