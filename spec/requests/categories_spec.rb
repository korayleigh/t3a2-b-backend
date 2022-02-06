# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categories:', type: :request do
  describe 'index:' do
    let!(:categories) { create_list(:category, 5) }

    before { get '/api/categories' }

    it 'responds with all categories' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'responds with status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'show:' do
    before do
      @category = create(:category)
      get "/api/categories/#{@category.id}"
    end

    it 'responds with the requested category' do
      expect(JSON.parse(response.body)['name']).to eq(@category.name)
    end

    it 'responds with status: ok' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create:' do
    before do
      post '/api/categories', params: {
        category: {
          name: 'test_category'
        }
      }
    end

    it 'responds with the created category' do
      expect(JSON.parse(response.body)['name']).to eq('test_category')
    end

    it 'responds with status: created' do
      expect(response).to have_http_status(:created)
    end
  end

  describe 'update:' do
    before do
      @category = create(:category)
      @new_category_name = Faker::Food.ethnic_category
      put "/api/categories/#{@category.id}",
          params: { category: {
            name: @new_category_name
          } }
    end

    it 'updates a category name' do
      expect(Category.find(@category.id).name).to eq(@new_category_name)
    end

    it 'responds with status: created' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'delete:' do
    before do
      @category = create(:category)
      delete "/api/categories/#{@category.id}"
    end

    it 'deletes the requested question' do
      expect { Category.find(@category.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'responds with status: no content' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
