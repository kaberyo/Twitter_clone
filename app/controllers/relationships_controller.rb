class RelationshipsController < ApplicationController
      def create
      Relationship.create(create_params)
      redirect_to(:back)
    end

    def destroy
      relationship =  Relationship.find(params[:id])
      relationship.destroy
      redirect_to(:back)
    end

  private

    def create_params
        params.permit(:following_id).merge(follower_id: current_user.id)
    end

end
