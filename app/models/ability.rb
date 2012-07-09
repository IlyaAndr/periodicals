class Ability
  include CanCan::Ability

  def initialize(user)

    user ||=User.new

    can [:index, :show], [Edition, Kind]

    if user.admin?
      can :manage, :all
    elsif user.id
      can [:read, :create, :destroy, :pay], Subscription, user_id: user.id
      can [:delete_from_cart, :add_to_cart, :cart], User, id: user.id
    end

  end

end

