require 'rails_helper'

RSpec.describe V1::ParkingsController, type: :controller do

  describe 'GET #show' do
    render_views
    let(:plate_number) { 'YUI-5567' }
    let!(:parking) { create :parking, status: :in_progress, plate: plate_number }

    it 'returns a history with all parkings with specified plate number' do
      @request.headers['api_version'] = 'v1'
      get :show, params: {plate: plate_number}, format: :json
      expect(response).to have_http_status(200)

      parsed_response = JSON.parse(response.body)
      expect(parsed_response.size).to eq(1)
      expect(parsed_response.last).to include({'id'=>1, 'paid'=>false, 'status'=>'in_progress'})
      expect(parsed_response.last).to have_key('time')
    end
  end
end
