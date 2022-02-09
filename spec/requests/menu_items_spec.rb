# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Menu Items:', type: :request do
  describe 'index:' do
    before do
      create_list(:menu_item, 5)
      get '/api/menu_items'
    end

    it 'responds with all menu items' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'responds with status code 200' do
      expect(response).to have_http_status(:ok)
    end
    it 'responds with content type: application/json' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
end
