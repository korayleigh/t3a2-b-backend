# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders:', type: :request do
  describe 'index:' do
    let!(:orders) { create_list(:order, 5) }

    before do
      admin_role = FactoryBot.create(:role, name: 'Admin')
      employee = FactoryBot.build(:employee, role: admin_role)
      admin = FactoryBot.create(:user, :admin, userable: employee)
      sign_in admin
      get '/api/orders'
    end

    it 'responds with all orders' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'responds with status code 200' do
      expect(response).to have_http_status(:ok)
    end
    it 'responds with content type: application/json' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'show:' do
    let!(:order) { create(:order) }
    before do
      admin_role = FactoryBot.create(:role, name: 'Admin')
      employee = FactoryBot.build(:employee, role: admin_role)
      admin = FactoryBot.create(:user, :admin, userable: employee)
      sign_in admin
      get "/api/orders/#{order.id}"
    end

    it 'responds with the requested order' do
      expect(JSON.parse(response.body, symbolize_names: true)).to include(order.transform_order.reject { |k, _| k == :created_at })
    end
    it 'responds with status: ok' do
      expect(response).to have_http_status(:ok)
    end
    it 'responds with content type: application/json' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'create:' do
    let!(:new_order_attributes) { FactoryBot.attributes_for(:order) }
    before do
      admin_role = FactoryBot.create(:role, name: 'Admin')
      employee = FactoryBot.build(:employee, role: admin_role)
      admin = FactoryBot.create(:user, :admin, userable: employee)
      sign_in admin
      post '/api/orders', params: { order: new_order_attributes }
    end

    it 'responds with the created order' do
      expect(JSON.parse(response.body, symbolize_names: true)).to include(**new_order_attributes)
    end
    it 'responds with status: created' do
      expect(response).to have_http_status(:created)
    end
    it 'responds with content type: application/json' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'update:' do
    let!(:order) { create(:order) }
    let!(:new_order_attributes) { FactoryBot.attributes_for(:order) }
    before do
      admin_role = FactoryBot.create(:role, name: 'Admin')
      employee = FactoryBot.build(:employee, role: admin_role)
      admin = FactoryBot.create(:user, :admin, userable: employee)
      sign_in admin
      put "/api/orders/#{order.id}", params: { order: new_order_attributes }
    end

    it 'updates order' do
      new_order_attributes.each do |attribute|
        expect(Order.find(order.id)[attribute]).to eq(new_order_attributes[attribute])
      end
    end
    it 'responds with status: created' do
      expect(response).to have_http_status(:ok)
    end
    it 'responds with content type: application/json' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'delete:' do
    let!(:order) { create(:order) }
    before do
      admin_role = FactoryBot.create(:role, name: 'Admin')
      employee = FactoryBot.build(:employee, role: admin_role)
      admin = FactoryBot.create(:user, :admin, userable: employee)
      sign_in admin
      delete "/api/orders/#{order.id}"
    end

    it 'deletes the requested order' do
      expect { Order.find(order.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
    it 'responds with status: no content' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
