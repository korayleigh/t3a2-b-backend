# frozen_string_literal: true

require 'rails_helper'

api_path = '/api/order_items'

RSpec.describe 'Order Items:', type: :request do
  describe 'index:' do
    before do
      create_list(:order_item, 5)
      get api_path
    end

    it 'responds with all order_items' do
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
    let!(:order_item) { create(:order_item) }
    before do
      get "#{api_path}/#{order_item.id}"
    end

    it 'responds with the requested order_item' do
      expect(JSON.parse(response.body, symbolize_names: true)).to include(order_item.transform_order_item)
    end
    it 'responds with status: ok' do
      expect(response).to have_http_status(:ok)
    end
    it 'responds with content type: application/json' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'create:' do
    let!(:menu_item) { create(:menu_item) }
    let!(:order) { create(:order) }
    let!(:new_order_item_attributes) do
      FactoryBot.attributes_for(:order_item, menu_item_id: menu_item.id, order_id: order.id)
    end

    before do
      post api_path, params: { order_item: new_order_item_attributes }
    end

    it 'responds with the created order_item' do
      expect(JSON.parse(response.body, symbolize_names: true)).to include(**new_order_item_attributes)
    end
    it 'responds with status: created' do
      expect(response).to have_http_status(:created)
    end
    it 'responds with content type: application/json' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'update:' do
    let!(:menu_item) { create(:menu_item) }
    let!(:order) { create(:order) }
    let!(:order_item) do
      FactoryBot.create(:order_item, menu_item_id: menu_item.id, order_id: order.id)
    end

    let!(:new_order_item_attributes) { FactoryBot.attributes_for(:order_item) }
    before do
      put "#{api_path}/#{order_item.id}", params: { order_item: new_order_item_attributes }
    end

    it 'updates order_item attributes' do
      new_order_item_attributes.each do |attribute, value|
        expect(OrderItem.find(order_item.id)[attribute]).to eq(value)
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
    let!(:order_item) { create(:order_item) }
    before do
      delete "#{api_path}/#{order_item.id}"
    end
    it 'deletes the requested order_item' do
      expect { OrderItem.find(order_item.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
    it 'responds with status: no content' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
