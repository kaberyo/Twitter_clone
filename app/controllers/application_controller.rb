class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def user_followers_count
    users = User.all
    users.each do |user|
      user.followers_count = user.followers.count
      user.save
    end
    candidates = User.where.not(id:current_user.id).where.not(id:current_user.following.ids)
    @recommends = candidates.order("followers_count DESC").limit(2)
  end

    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def tagscount
    tags = Tag.all
    tags.each do |tag|
      tag.tags_count = tag.tweets.count
      tag.save
    end
    @trend = Tag.order("tags_count DESC")
  end

end
