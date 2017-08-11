class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
      alias_action :create, :read, :update, :destroy, to: :crud
  
      # Always performed
      can :access, :ckeditor   # needed to access Ckeditor filebrowser
      # Performed checks for actions:
      can [:read, :create, :destroy], Ckeditor::Picture
      can [:read, :create, :destroy], Ckeditor::AttachmentFile
  
    #
      user ||= User.new # guest user (not logged in)
      if user.has_role? :admin
        can :manage, :all
      else
        can :manage, [Lesson, Tutor, Practice, Textbook, Catalog, Teaching, Plan, Evaluation, Justice, Classroom, Member, Discussion, Complaint, Homework, Observation, Teacher, Subject, Exercise, Cadre, Badrecord, Cardbox, Card, Master, Sectionalization, Team, Player, Classgroupscore, Classpersonscore, Onboard, Receipt, Cashier, Withdraw, Quiz, QuizItem, Paper, Paperitem, Papertest, Examroom, Roadmap, Pace, Comment, Agreement, Booklist],  user_id: user.id
	      can :read, [Lesson, Tutor, Practice, Textbook, Catalog, Teaching, Plan, Evaluation, Justice, Classroom, Member, Discussion, Complaint, Homework, Observation, Teacher, Subject, Exercise, Cadre, Badrecord, Cardbox, Card, Sectionalization, Team, Player, Classgroupscore, Classpersonscore, Onboard, Receipt, Cashier, Withdraw, Quiz, QuizItem, Paper, Paperitem, Papertest, Examroom, Roadmap, Pace, Comment, Agreement, Booklist]
      end
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
