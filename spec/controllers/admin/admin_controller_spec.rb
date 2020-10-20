require 'rails_helper'

describe Admin::AdminController do
  describe 'GET index' do
    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end
    it 'returns http success' do
    end
  end
end