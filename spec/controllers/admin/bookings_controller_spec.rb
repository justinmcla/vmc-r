require 'rails_helper'

describe Admin::BookingsController do

  describe 'GET new' do

    before do
      get :new
    end

    it 'renders :new template' do
      expect(response).to render_template(:new)
    end
    it 'assigns new Booking to @booking' do
      expect(assigns(:booking)).to be_a_new(Booking)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

  end

  describe 'GET show' do

    let(:booking) { FactoryBot.create(:booking) }

    before do
      get: show, id: booking
    end

    it 'renders :show template' do
      expect(response).to render_template(:show)
    end
    it 'assigns requested Booking to @booking' do
      expect(assigns(:booking)).to eq(booking)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

  end

  describe 'POST create' do
    context 'valid data' do 
      it 'redirects to bookings#show' do
        post :create, booking: FactoryBot.attributes_for(:booking)
        expect(response).to redirect_to(booking_path(assigns[booking]))
      end
      it 'creates new booking in database' do
        expect { 
          post :create, booking: FactoryBot.attributes_for(:booking) 
        }.to change(Booking, :count).by(1)
      end

    end
    context 'invalid data' do

    end

  end

end