class PhotosController < ApplicationController
  def show
    @photo = Photo.find(params[:id])
    @comments = @photo.comments
  end

  def new
    @photo = Photo.new
  end

  def edit
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

  def comment_create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build(comment_params)

    if @comment.save
      redirect_to photo_path(@photo), notice: "Comment created successfully"
    else
      @comments = @photo.comments
      render :show
    end
  end

  def update
    @pohto = Photo.find(params[:id])

    if @photo.update(photo_params)
      redirect_to photo_path(@photo)
    else
      render "edit", status: :unprocessable_entity
    end 
  end

  def destroy; end

  def search
    @photos = Photo.search(params[:query].downcase)
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :category_id, :image, :id)
  end
end
