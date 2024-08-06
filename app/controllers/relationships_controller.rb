class RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def show
    @user = User.find(params[:user_id])
    @followeds = @user.followeds
    @followers = @user.followers
  end
end
