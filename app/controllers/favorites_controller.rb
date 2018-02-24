class FavoritesController < ApplicationController
  before_action :require_user_logged_in


  def create
    
    @micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(@micropost)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_back(fallback_location: root_url)

  end

  def destroy
    # binding.pry
    @micropost = Micropost.find(params[:micropost_id])
    
    current_user.unfavorite(@micropost)
    flash[:success] = 'お気に入りを解除しました。'
    # redirect_to :root_url
    redirect_back(fallback_location: root_url)

  end
end
