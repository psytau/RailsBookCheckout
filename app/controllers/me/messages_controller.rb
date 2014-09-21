class Me::MessagesController < Me::BaseController
  def index
    @messages = Message.where('user_id = ?', current_user.id)
  end
  def show
    @message = Message.find(params[:id])
  end
end
