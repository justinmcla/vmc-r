require 'rails_helper'

describe Admin::InsightsController do

  describe 'GET index' do

    it 'renders :index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

  end
end