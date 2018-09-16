class Admin::StationsController < Admin::BaseController

  def index
    @stations = Station.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @station = Station.friendly.find(params[:id])
  end

  def new
    @station = Station.new
  end
  
  def create
    @station = Station.new(station_params)
    if @station.save
      flash[:notice] = "New Station added!"
      redirect_to stations_path
    else
      flash[:notice] = "Station was not created."
      redirect_to new_admin_station_path
    end
  end
  
  def edit
    @station = Station.friendly.find(params[:id])
  end

  def update
    station = Station.friendly.find(params[:id])
    station.update(station_params)
    if station.save
      flash[:notice] = "#{station.name} updated!"
      redirect_to station_path(station)
    else
      flash[:notice] = "All attributes must be present, update failed."
      redirect_to edit_admin_station_path(station)
    end
  end

  private
    def station_params
      params.require(:station).permit(:name, :dock_count, :city, :installation_date)
    end
end
