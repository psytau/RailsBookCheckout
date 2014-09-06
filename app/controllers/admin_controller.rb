class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :auth_admin!, except: [:view_as_self]

  def users
    @users = User.all
  end

  def can_do_review user, can_do_it
    user.banned_from_reviewing = !can_do_it
    user.save!
    render json: {user_id: user.id, can_do_it:  !user.banned_from_reviewing, it: :review}
  end

  def can_do_rate user, can_do_it
    user.banned_from_rating = !can_do_it
    user.save!
    render json: {user_id: user.id, can_do_it: !user.banned_from_rating, it: :rate}
  end

  def can_do_admin user, can_do_it
    if can_do_it
      user.add_role :admin
    else
      user.remove_role :admin
    end
    user.save!
    render json: {:user_id => user.id, :can_do_it=> user.is_admin?, it: :admin}
  end

  def can_do
    possible_cans = ['review', 'admin', 'rate']
    user = User.find(params[:user])
    it = params[:it]
    if params[:can_do_it] == 'true'
      can_do_it = true
    elsif params[:can_do_it] == 'false'
      can_do_it = false
    else
      raise :bad_params
    end
    if i = possible_cans.index(it)
      send(:"can_do_#{possible_cans[i]}", user, can_do_it)
    end

  end

  def books
    @books = Book.all
  end

  def users_report
    @users = User.all
  end

  def view_as_user
    session[:view_as_user] = params[:view_as_user]
    redirect_to '/books'
  end

  def view_as_self
    session[:view_as_user] = nil
    redirect_to '/admin/users'
  end


  private
    def auth_admin!
      authorize! :admin, :site
    end
end
