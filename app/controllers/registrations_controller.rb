class RegistrationsController < Devise::RegistrationsController

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, 
    								:rate_email, :review_email, :daily_summary)
  end
end