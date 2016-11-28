class ApplicationPolicy
  attr_reader :user, :record


  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    #initializes and sets user and record variables
    @user = user
    @record = record
  end

  def index?
    #gives only users permission to access index
    false
  end

  def show?
    @current_user == @user
  end

  def create?
    is_admin?
  end

  def new?
    create?
  end

  def update?
    is_admin?
  end

  def edit?
    update?
  end

  def destroy?
    is_admin?
  end

  def scope
    record.class
  end
  def update?
    user.admin?
  end

  private

  def is_admin?
    #confirms that current user is an admin
    current_user.admin?
  end
end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
