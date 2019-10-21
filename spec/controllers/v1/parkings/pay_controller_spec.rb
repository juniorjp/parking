require 'rails_helper'

RSpec.describe V1::Parkings::PayController, type: :controller do
  describe 'PUT #update' do
    let(:parking) { create :parking, status: :in_progress }
    it 'returns http success' do
      @request.headers['api_version'] = 'v1'
      put :update, params: {id: parking.id}, format: :json
      expect(response).to have_http_status(200)
      expect(parking.reload.paid?).to eq(true)
    end
  end
end
