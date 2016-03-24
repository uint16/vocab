class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role?(:admin)
      can :manage, :all
    end

    if Course.with_role(:teacher, user).any?
      can :manage, Definition
      can :manage, Sentence
      can :manage, Synonym
      can [:create, :update, :show], User
      can :manage, Word
      can :manage, WordRoot
      can :manage, WordForm
      can :manage, WordVideo
      can :manage, Course
      can :manage, CourseEmail
      can :manage, Lesson
      can :manage, LessonModule
      can :manage, Synonym
      can :manage, Event
      can :manage, Question
      can :manage, LessonExtension
      can :manage, LessonWord
      can :manage, Answer

    end

    if Course.with_role(:student, user).any?
      can [:index, :show], Word
      can [:index, :show], WordVideo
      can [:index, :show], WordRoot
      can [:index, :show], WordForm
      can [:index, :show], Synonym
      can [:index, :show], Sentence
      can [:index, :show], Course
      can [:index, :show], Lesson
      can [:index, :show], LessonModule
      can [:index, :show], Event
      can [:index, :show], LessonExtension
      can [:index, :show], Answer
    end

  end
end
