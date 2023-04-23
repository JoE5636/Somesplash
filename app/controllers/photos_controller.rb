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
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to photo_path(@photo)
    else
      render "edit", status: :unprocessable_entity
    end 
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to photo_path, status: :see_other
  end

  def search
    query = params[:query]
    if query.blank?
      render "search"
    else
     @photo = Photo.includes(:image_attachment).where("LOWER(title) LIKE ?", "%#{query}%")
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :category_id, :image, :id)
  end
end
