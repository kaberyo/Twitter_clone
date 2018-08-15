class RelationshipsController < ApplicationController

  def createAPP
    @user = User.find(params[:following_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

 def destroy
    @user = Relationship.find(params[:id]).following
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  private

    def create_params
        params.permit(:following_id).merge(follower_id: current_user.id)
    end

end
