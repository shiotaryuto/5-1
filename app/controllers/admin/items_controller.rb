class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to admin_items_path
    else
    @items = Item.all
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to admin_items_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:iamge, :name, :introduction, :price, :genre_id)
  end

end
