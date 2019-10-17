class ApplicationController < ActionController::Base
  

  def authenticate_user!(options={})
    unless current_user
      render json: { data: '', success: false, code:0, message: 'You need to Sign In/Sign Up' },
             status: :unauthorized
    end
  end


  def current_user
    @token = AuthenticationToken.find_by(auth_token: request.headers['auth-token'])
    @current_user ||= @token.try(:user)
  end

end
