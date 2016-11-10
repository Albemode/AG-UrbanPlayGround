class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    # @events = Event.all
    @locations = Location.all
    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.infowindow location.title
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    # @markers = @event.markers
    # @gmaps_options = @markers.to_gmaps4rails
    @location = Location.find(params[:id])

  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)
  #   Model.all.to_gmaps4rails do |object|
  # "\"link\": \"your link as string\""
# end

    # @json = User.all.to_gmaps4rails do |user, marker|
    #   marker.json "\"id\": #{user.id}"
    #     # or
    #   marker.json "\"link\": #{method_to_create_link}"
    #   marker.infowindow "<h4><u>#{location_link}</u></h4>
    #                    <i>#{location.address}</i>"
  # end

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:address, :origin, :title, :name, :destination, :latitude, :longitude, :start_at, :description, :user_id)
    end
end
