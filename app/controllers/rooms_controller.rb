class RoomsController < ApplicationController
  def new
    @room = current_user.rooms.new
  end

  def create
    @room = current_user.rooms.new(room_params)
    if @room.save
      redirect_to listing_room_url(@room)
    else
      render 'new'
    end
  end

  def listing
    @room = Room.find(params[:id])
  end

  def price
    @room = Room.find(params[:id])
  end

  def description
    @room = Room.find(params[:id])
  end

  def photo
    @room = Room.find(params[:id])
    @photos = @room.photos
  end

  def amenity
    @room = Room.find(params[:id])
  end

  def location
    @room = Room.find(params[:id])
  end



  private
    def room_params
      params.require(:room).permit(:name, :home_type, :room_type, :gest_count, :bedroom_count, :bathroom_count, :price, :summary, :is_activity, :address, :has_TV, :has_kitchen, :has_internet, :hasheating, :has_air_conditioning)
    end
end
