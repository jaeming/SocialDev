class CommentPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.present?
  end

  def destroy?
    can_moderate?
  end

end