class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :auth_admin!

  def users
    @users = User.all
    temp_val = true
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

  def user_can_review
    @user = User.find(params[:user_id])
    temp_val = false
    if params[:can_review] == 'true'
      # can review
      temp_val = true
    elsif params[:can_review] == 'false'
      # can_not review
      temp_val = false
    end
    render json: {:user_id => @user.id, :can_review => temp_val}
  end

  private
    def auth_admin!
      authorize! :admin, :site
    end
end
