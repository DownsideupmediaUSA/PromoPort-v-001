class ArtistPolicy
  attr_reader :user, :model
  #these actions below are limited to either current users or admins

  def initialize(user, model)
    @user = user
    @model = model
  end


  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end




  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else user.super_user?
        scope.where(role[1,0])
      end
    end






end
end
