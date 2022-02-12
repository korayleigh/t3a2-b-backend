# frozen_string_literal: true

require 'rails_helper'

api_path = '/api/menu_items'

RSpec.describe 'Menu Items:', type: :request do
  before do
    admin_role = FactoryBot.create(:role, name: 'Admin')
    employee = FactoryBot.build(:employee, role: admin_role)
    admin = FactoryBot.create(:user, :admin, userable: employee)
    sign_in admin
  end

  describe 'index:' do
    before do
      create_list(:menu_item, 5)
      get api_path
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
