class PhotosController < ApplicationController
  def show
    @photo = Photo.find(params[:id])
    @comments = @photo.comments
    @newcomment = Comment.new
    # @comment = Photo.find(params[:id]).comments.create.comment_params
  end

  def new
    @photo = Photo.new
  end

  def edit; end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photo_path(@photo)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def comment_create
  #   @comment = Photo.find(params[:id]).comments.create.comment_params
  # end

  def update; end

  def destroy; end

  def search
    @photos = Photo.search(params[:query].downcase)
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :category_id, :image, :id)
  end

  def comment_params
    params.require(:photo).permit(:body)
  end
end
