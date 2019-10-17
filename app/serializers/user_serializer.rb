class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :bio, :is_verified, :username
  


  def auth_token
    scope.authentication_tokens.last.auth_token
  end

  def current_user?
    scope == object
  end

  
end
