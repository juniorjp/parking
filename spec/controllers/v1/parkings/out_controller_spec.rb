require 'rails_helper'

RSpec.describe V1::Parkings::OutController, type: :controller do
  describe 'PUT #update' do
    let(:parking) { create :parking, status: :in_progress }
    it 'returns http success' do
      @request.headers['api_version'] = 'v1'

      #first attempt without paying
      put :update, params: {id: parking.id}, format: :json
      expect(response).to have_http_status(500)

      #second attempt after paying
      parking.paid = true
      parking.save!
      put :update, params: {id: parking.id}, format: :json
      expect(response).to have_http_status(200)
    end
  end
end
