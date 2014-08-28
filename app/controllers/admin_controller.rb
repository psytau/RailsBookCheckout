class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :auth_admin!

  def users
    @users = User.all
  end

  def can_do_review user, can_do_it
    # TODO: fill this in
    render json: {user_id: user.id, can_do_it: can_do_it, it: :review}
  end

  def can_do_rate user, can_do_it
    # TODO: fill this in
    render json: {user_id: user.id, can_do_it: can_do_it, it: :rate}
  end

  def can_do_admin user, can_do_it
    if can_do_it
      user.add_role :admin
    else
      user.remove_role :admin
    end
    render json: {:user_id => user.id, :can_do_it=> user.is_admin?, it: :admin}
  end

  def can_do
    user = User.find(params[:user])
    it = params[:it]
    if params[:can_do_it] == 'true'
      can_do_it = true
    elsif params[:can_do_it] == 'false'
      can_do_it = false
    else
      raise :bad_params
    end
    if ['review', 'admin', 'rate'].include? it
      send(:"can_do_#{it}", user, can_do_it)
    end

  end

  def books
    @books = Book.all
  end


  private
    def auth_admin!
      authorize! :admin, :site
    end
end
