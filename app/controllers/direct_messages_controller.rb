class DirectMessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @message = DirectMessage.create(direct_message_params)
    redirect_to request.referer
  end

  private

  def direct_message_params
    params.require(:direct_message).permit(:body, :user_id, :room_id).merge(user_id: current_user.id)
  end

end
