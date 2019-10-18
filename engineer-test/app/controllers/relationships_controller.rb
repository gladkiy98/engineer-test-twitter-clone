class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:followee_id])
    current_user.follow(user)
    redirect_to users_path
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_to users_path
  end
end
