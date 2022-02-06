# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Order', type: :request do
  describe 'get orders index' do
    let(:headers) do
      { 'CONTENT_TYPE' => 'application/json' }
    end

    it 'responds with content type: application/json' do
      get '/api/orders', headers: headers
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'has status 200 OK' do
      get '/api/orders', headers: headers
      expect(response).to have_http_status(:ok)
    end

    it 'returns a reasonable amount of data' do
      get '/api/orders', headers: headers
      expect(response.body.length).to be > 50
    end
  end

  describe 'create an order' do
    let(:new_order) do
      {
        name: 'Banana',
        email: 'test@test.com',
        table: 3,
        order_items_attributes: [
          {
            menu_item_id: MenuItem.find_by(name: 'Guacamole').id,
            quantity: 2
          }, {
            menu_item_id: MenuItem.find_by(name: 'Pescado').id,
            quantity: 1
          }
        ]
      }
    end

    let(:new_order_json) do
      JSON.generate(new_order)
    end

    let(:new_order_regex) do
      /
        \A\{
          "id":\d+,   # The generated id
          "table":"#{new_order[:table] == 0 ? 'TakeAway' : "Table#{new_order[:table]}"}",   #  eg Table3 or TakeAway, quoted
          "name":"#{new_order[:name]}",  # name as quoted string
          "email":"#{new_order[:email]}",  # email as quoted string
          "total":\d+,                      # total as one or more digits
          "created_at":"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}Z", # date eg 2022-02-05T00:25:38.365Z
          "order_items":\{  # sub object
            "\d+":\{
              "id":\d+,    # the generated id
              "menu_item_id":#{new_order[:order_items_attributes][0][:menu_item_id]},  # the
              "status":"received",
              "price_at_order":\d+,  # the generated price
              "quantity":#{new_order[:order_items_attributes][0][:quantity]}
            \},
            "(\d+)":\{
              "id":\d+,
              "menu_item_id":#{new_order[:order_items_attributes][1][:menu_item_id]},
              "status":"received",
              "price_at_order":\d+,
              "quantity":#{new_order[:order_items_attributes][1][:quantity]}
            \}
          \}
        \}\Z
      /x
    end

    let(:headers) do
      { 'CONTENT_TYPE' => 'application/json' }
    end

    it 'responds with content type: application/json' do
      post '/api/orders', params: new_order_json, headers: headers
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'has status 200 OK' do
      post '/api/orders', params: new_order_json, headers: headers
      expect(response).to have_http_status(:ok)
    end

    it 'contains the new order' do
      post '/api/orders', params: new_order_json, headers: headers
      expect(response.body).to match(new_order_regex)
    end
  end
end
