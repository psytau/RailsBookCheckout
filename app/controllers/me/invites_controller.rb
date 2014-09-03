class Me::InvitesController < Me::BaseController
  def create

    UserMailer.invite(invite_params[:name], invite_params[:email], current_user.id).deliver!
    redirect_to root_url, notice: "Your invitation has been sent to #{invite_params[:name]}"
  end

  def new

  end
  def invite_params
    params.require(:invite).permit(:email, :name)
  end
end
