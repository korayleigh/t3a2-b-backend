# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categories:', type: :request do
  describe 'index:' do
    before do
      create_list(:category, 5)
      get '/api/categories'
    end

    it 'responds with all categories' do
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
    let!(:category) { create(:category) }
    before do
      get "/api/categories/#{category.id}"
    end

    it 'responds with the requested category' do
      expect(JSON.parse(response.body)['name']).to eq(category.name)
    end
    it 'responds with status: ok' do
      expect(response).to have_http_status(:ok)
    end
    it 'responds with content type: application/json' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'create:' do
    let!(:new_category_attributes) { FactoryBot.attributes_for(:category) }
    before do
      post '/api/categories', params: { category: new_category_attributes }
    end

    it 'responds with the created category' do
      expect(JSON.parse(response.body, symbolize_names: true)).to include(**new_category_attributes)
    end
    it 'responds with status: created' do
      expect(response).to have_http_status(:created)
    end
    it 'responds with content type: application/json' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'update:' do
    let!(:category) { create(:category) }
    let!(:new_category_attributes) { FactoryBot.attributes_for(:category) }
    before do
      put "/api/categories/#{category.id}", params: { category: new_category_attributes }
    end

    it 'updates category attributes' do
      new_category_attributes.each do |attribute|
        expect(Category.find(category.id)[attribute]).to eq(new_category_attributes[attribute])
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
    let!(:category) { create(:category) }
    before do
      delete "/api/categories/#{category.id}"
    end
    it 'deletes the requested category' do
      expect { Category.find(category.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
    it 'responds with status: no content' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
