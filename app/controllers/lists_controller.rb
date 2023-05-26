class ListsController < ApplicationController
  def create
    @list = List.new(list_params)

    if @List.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def index
    @lists = List.all
  end

  def destroy
    @list = Review.find(params[:id])
    @list.destroy
    redirect_to list_path(@list.List), status: :see_other
  end

  private

  def set_bookmark
    @list = List.find(params[:bookmark_id])
  end

  def list
    params.require(:list).permit(:name, :address, :phone_number, :category)
  end
end
