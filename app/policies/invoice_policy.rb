class InvoicePolicy < ApplicationPolicy
  def index_owner?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit
    update?
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.all
      scope.where(user: user)
    end
  end
end
