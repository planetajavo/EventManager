class ApplicationPolicy
  attr_reader :user, :record

  #record es el objeto sobre el que queremos implementar nuestra política (el objeto sobre el que vamos a hacer nuestra validacion)

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end
# para poder hacer el new tienes que tener permiso de create
  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end

