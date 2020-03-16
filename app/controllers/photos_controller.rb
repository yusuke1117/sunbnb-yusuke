class PhotosController < ApplicationController
  def create
    @room = Room.find(params[:room_id])

    if params[:images]
      params[:images].each do |img|
        @room.photos.create(image: img) #create photo and save to db
      end

      @photos = @room.photos #get 
      redirect_back(fallback_location: request.referer, notice: "Saved...")
    end
  end
end
