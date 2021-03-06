class Ability
  include CanCan::Ability

  def initialize(user)
    # anyone can see these
    can :read, [Book, BookReview, Rating]
    if user
      if user.is_admin?  # use rolify
        can :approve, Book
        can :toggle_activation, Book
        can :manage, :all
        can :admin, :site
      else
        can :create, Book
        can [:update, :destroy], Book, :user_id => user.id
        if !user.banned_from_reviewing
          can [:create, :destroy], BookReview
          can [:update, :destroy], BookReview, :user_id => user.id
        end
        if !user.banned_from_rating
          can [:create, :destroy], Rating
          can [:update, :destroy], Rating, {:user_id => user.id}
        end
      end
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
