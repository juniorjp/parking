module V1
  class ParkingsController < ApplicationController

    #TODO: do not create if there is an existing parking with same plate number with in_progress status
    def create
      success, @parking = Parking.create_default(params[:plate])

      if success
        render :parking
      else
        render json: {error: @parking.errors.details}, status: 422
      end
    end

    def show
      @parkings = Parking.where(plate: params[:plate]).order(id: :desc)
      render :parkings
    end
  end
end
