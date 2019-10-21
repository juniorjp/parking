module V1
  class Parkings::OutController < ApplicationController
    before_action :load_parking

    def update
      if @parking.paid? && @parking.update_attributes(status: :finished, finished_at: Time.zone.now)
        return head :ok
      end
      head 500
    end

    private

    def load_parking
      @parking = Parking.find(params[:id])
    end
  end
end
