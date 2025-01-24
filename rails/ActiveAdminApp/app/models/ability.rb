class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= Teacher.new

    if user.is_a?(AdminUser)
      can :manage, :all
    else
      can :read, School, id: user.school_id
      can :read, SchoolClass, school_id: user.school_id
      can :read, Student, school_class: { school_id: user.school_id }
    end
  end
end
