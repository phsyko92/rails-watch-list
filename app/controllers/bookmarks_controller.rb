class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @Bookmark.save
      redirect_to bookmark_path(@bookmark)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @bookmark = Bookmark.new
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def index
    @bookmarks = Bookmark.all
  end

  def destroy
    @bookmark = Review.find(params[:id])
    @bookmark.destroy
    redirect_to bookmark_path(@bookmark.Bookmark), status: :see_other
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:bookmark_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:name, :address, :phone_number, :category)
  end
end
