class PhotosController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
  
    # def destroy
    #   @photo = Photo.find(params[:id])
    #   @photo.destroy
      
    #   redirect_back(fallback_location: request.referer, notice: "Saved...")
    #   end

    def destroy
      @photo = Photo.find(params[:id])
      room = @photo.room

      @photo.destroy
      @photos = Photo.where(room_id: room.id)

      respond_to :js

    end

    if params[:images]
      params[:images].each do |img|
        @room.photos.create(image: img) #create photo and save to db
      end

      @photos = @room.photos #get 
      redirect_back(fallback_location: request.referer, notice: "Saved...")
    end
  end
end
