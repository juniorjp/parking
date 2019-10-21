module V1
  class ParkingsController < ApplicationController

    def show
      @parkings = Parking.where(plate: params[:plate]).order(id: :desc)
      render :parkings
    end
  end
end
