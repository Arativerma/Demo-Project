class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUsers.new # Guest user

    if user.admin?
      can :manage, :all
      can :manage, Course
       can :read, Course 
       can :manage, Category 
    elsif user.student?
      can :read, Course
      can :purchase, Course
      # Add more abilities specific to students
    elsif user.teacher?
      can :read, Course

      can :manage, Course

      can :manage, Category
      # Add more abilities specific to teachers
    else
      # Guest user abilities (unauthenticated)
      can :read, Course
      # Add more abilities for guest users
    end
  end
end
