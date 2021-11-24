class ItemsController < ApplicationController

  def index
   if params[:user_id]
    user = User.find(params[:user_id])
    items = user.items
   else
    items = Item.all
   end
   render json: items, include: :user
  rescue ActiveRecord::RecordNotFound 
    render json: {error: "User not found"}, status: :not_found
  end

end
