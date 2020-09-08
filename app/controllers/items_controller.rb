class ItemsController < ApplicationController

  def new
    @item =Item.new
  end


  def create
    binding.pry
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
 @item =Item.find(params[:id])
 @like =Like.new
 @comments = @item.comments
 @comment = @item.comments.build
end

def edit
  @item =Item.find(params[:id])
end

def update
  @item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to 
  else
    render :edit
  end
end

  def destroy
    @item =Item.find(params[:id])
    if @item.destroy
      redirect_to root_path
      else
        render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :content,:comment, :brand, :period_start, :period_end, :category_id, :status_id, :fee_id, :arium_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
