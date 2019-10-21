require 'rails_helper'

RSpec.describe V1::ParkingsController, type: :controller do
  
  describe 'POST #create' do
    render_views
    let(:plate_number) { 'GTX-4498' }
    let(:invalid_plate_number){ 'IUU-776555' }

    it 'returns http success with a new parking model' do
      @request.headers['api_version'] = 'v1'
      post :create, params: {plate: plate_number}, format: :json
      expect(response).to have_http_status(200)
      expect(Parking.count).to eq(1)
      parking = Parking.last
      expect(parking.plate).to eq(plate_number)
    end

    it 'returns 422 if the plate number is invalid' do
      post :create, params: {plate: invalid_plate_number}, format: :json
      expect(response).to have_http_status(422)
      expect(Parking.count).to eq(0)
    end
  end

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
