class Me::InvitesController < Me::BaseController
  def create

    # UserMailer.invite(invite_params[:name], invite_params[:email], current_user.id).deliver!

    firstname, lastname = invite_params[:name].split
    user_attrs = {
      email: invite_params[:email],
      firstname: firstname,
      lastname: lastname
    }
    user = User.invite!(user_attrs)
    if can?(:admin, :site) && (invite_params[:can_admin] == '1')
      user.add_role :admin
    end
    redirect_to root_url, notice: "Your invitation has been sent to #{invite_params[:name]}."
  end

  def new

  end
  def invite_params
    params.require(:invite).permit(:email, :name, :can_admin)
  end
end
