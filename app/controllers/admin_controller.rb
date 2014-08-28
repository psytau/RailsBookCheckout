class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :auth_admin!

  def users
    @users = User.all
  end

  def make_admin
    @user = User.find(params[:user_id])
    if params[:is_admin] == 'true'
      @user.add_role :admin
    elsif params[:is_admin] == 'false'
      @user.remove_role :admin
    end
    render json: {:user_id => @user.id, :is_admin => @user.is_admin?}
  end

  private
    def auth_admin!
      authorize! :admin, :site
    end
end
