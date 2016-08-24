class ItemController < ApplicationController
  def index
  	@items = Item.all
  
  end
def index
  @items = Item.all
  if params[:search]
    @items = Item.search(params[:search]).order("created_at DESC")
  else
    @items = Item.all.order('created_at DESC')
  end
end
 

  def show
  	@item = Item.find(params[:id])

  end

  def new
  	@item = Item.new
  end

  def edit
  	@item = Item.find(params[:id]) 
  end


def create
 @item = Item.new(item_params)
 if @item.save
 redirect_to root_path
 else
 render 'new'
 end
end 

def update
 @item = Item.find(params[:id])
 if @item.update(item_params)
 redirect_to root_path
 else
 render 'edit'
 end
end 

def delete
 @item = Item.find(params[:id])
 if @item.destroy
 redirect_to root_path
 else
 render item_show_path(@item)
 end
end 

private
def item_params
 params.require(:item).permit(:id, :name, :price)
end

end