class TripsController < ApplicationController

  def index
    @trips = Trip.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @trip = Trip.find(params[:id])
  end
end
