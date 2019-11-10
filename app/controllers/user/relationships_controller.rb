class User::RelationshipsController < ApplicationController
  def create
  	follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    redirect_back fallback_location: request.referrer
    #この記述で一つ前のURLを返す
  end

  def destroy
  	follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_back fallback_location: request.referrer
  end
end
