class NotificationsController < ApplicationController
  before_action :recommend_users, only: :link_through
  def link_through
    @notification = Notification.find(params[:id])
    @tweet = @notification.tweet
    @notification.update read: true
  end
end
