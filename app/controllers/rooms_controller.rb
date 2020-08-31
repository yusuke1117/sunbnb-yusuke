class RoomsController < ApplicationController
  before_action :set_room, except: [:index, :new, :create, :autocomplete_room_address]
  before_action :authenticate_user!, except: [:show, :autocomplete_room_address]
  before_action :is_authorized, only: [:listing, :pricing, :description, 
                                      :photo_upload, :amenities, :location, :update]
  autocomplete :room, :address, full: true, where: {active: 1}, unique: true
  
  def new
    @room = current_user.rooms.new
  end

  def index
    # @rooms = current_user.rooms
    @rooms = current_user.rooms.paginate(page: params[:page], per_page: 5)
  end

  def show
    @photos = @room.photos
    @guest_reviews = @room.guest_reviews
  end

  def create
    @room = current_user.rooms.new(room_params)
    if @room.save
      redirect_to listing_room_url(@room)
    else
      render 'new'
    end
  end

  def update
    final_params = is_not_ready?(@room) ? room_params : room_params.merge(is_active: true)  
    if @room.update(final_params)
      flash[:notice] = "Successfully updated!"
    else
      flash[:notice] = "Failed to update!"
    end

    redirect_back(fallback_location: request.referer)
  end

  def listing
  end

  def price
  end

  def description
  end

  def photo_upload
    @photos = @room.photos
  end

  def amenity
  end

  def location
  end

  def preload
    today = Date.today
    reservations = @room.reservations.where("start_date >= ? OR end_date >= ?", today,today)
  
    render json: reservations
  end

  def preview
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    output = {
      conflict: has_conflict(start_date, end_date, @room)
    }

    render json: output
  end


  private
    def is_conflict(start_date, end_date, room)
      check = room.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
      check.size > 0 ? true : false
    end

    def set_room
      @room = Room.find(params[:id])
    end

    def is_authorized
      redirect_to root_path, alert: "You don't have permission" unless current_user.id == @room.user_id
    end

    def is_ready_room
      !@room.active && !@room.price.blank? && !@room.listing_name.blank? && !@room.photos.blank? && !@room.address.blank?
    end

    def room_params
      params.require(:room).permit(:name, :home_type, :room_type, :gest_count, :bedroom_count, :bathroom_count, :price, :summary, :is_activity, :address, :has_TV, :has_kitchen, :has_internet, :has_heating, :has_air_conditioning)
    end
end
