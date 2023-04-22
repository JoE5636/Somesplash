class PhotosController < ApplicationController
  def new
    @photo = Photo.new
    @category = Category.find(params[:category_id])
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photo_path(@photo)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @photos = Photo.search(params[:query].downcase)
  end

  private 

  def photo_params
    params.require(:photo).permit(:title, :description, :category_id, :image, :id)
  end
end
