module V1
  class Parkings::PayController < ApplicationController
    before_action :load_parking, only: [:update]

    def update
      if @parking.update_attributes(paid: true)
        return head :ok
      end
      head 422
    end

    private

    def load_parking
      @parking = Parking.find(params[:id])
    end
  end
end
