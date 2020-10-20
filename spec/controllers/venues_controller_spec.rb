require 'rails_helper'

describe VenuesController do

  let(:venue) { FactoryBot.create(:venue) }

  describe 'GET index' do

    it 'assigns @venues based on search params' do
      params = { name: 'test theater' }
      get :index
      expect(:venues).to eq(venue)
    end

    it 'renders :index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

  end

  describe 'GET show' do

    before do
      get :show, id: venue
    end

    it 'renders :show template' do
      expect(response).to render_template(:show)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

  end

end