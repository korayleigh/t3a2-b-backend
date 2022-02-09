# frozen_string_literal: true

require 'rails_helper'

# RSpec.describe 'Menu Items Controller', type: :request do
#   describe 'GET /menu' do
#     it 'indexes all menu items' do
#       get '/api/menu'
#       expect(response.content_type).to eq('application/json; charset=utf-8')
#       expect(response).to have_http_status(:ok)
#     end
#   end

#   describe 'POST /menu_item' do
#     let(:successful_menu_item_params) do
#       {
#         menu_item: {
#           name: 'Birria Tacos',
#           price: 1111,
#           description: 'Marinated, slow cooked beef tacos served with consome for dipping',
#           category_id: 2
#         }
#       }
#     end

#     let(:unsuccessful_menu_item_params) do
#       {
#         menu_item: {
#           price: 900,
#           description: 'Marinated, slow cooked beef tacos served with consome for dipping',
#           category_id: 2
#         }
#       }
#     end

#     it "should have a http status of 'unprocessable entity' when omitting some parameters" do
#       post menu_item_path, params: unsuccessful_menu_item_params
#       expect(response).to have_http_status(:unprocessable_entity)
#     end

#     it "should have a http status of 'created' when creating a valid object" do
#       post menu_item_path, params: successful_menu_item_params
#       expect(response).to have_http_status(:created)
#     end

#     it 'the created object should contain the submitted parameters' do
#       post menu_item_path, params: successful_menu_item_params
#       expect(response.body).to include(successful_menu_item_params[:menu_item][:name])
#     end
#   end
# end
