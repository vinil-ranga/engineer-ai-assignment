class RegistrationController <  Devise::RegistrationController






  def new
    if params[:email].present?
      render json: {success: false, code: 0 , data: '' , message: 'Email already exist'}, status: :unprocessable_entity and return if User.find_by_email(params[:email]).present?
      tag = User.generate_username(params[:email])
      render json: {success: true, code: 1 , message: '', data: tag}
    else
      render json: {success: false, code: 0 , data: '' , code:0, message: 'Email must exist'}, status: :unprocessable_entity
    end
  end



 def show
    begin
      @user = User.find(params[:id])
      # render json: user, scope: @current_user
      render json: { data: UserSerializer.new(@user, scope: @current_user).attributes,code:1,success: true,message:"" }
 
    rescue => e
      render json: {success: false, code: 0 , data: '' ,message: e}, status: :not_found
    end
  end

  # POST /resource
  def create
    @user = User.new(sign_up_params)
    if @user.save
      @user.authentication_tokens.last.update(device_token: params[:device_token])
        render json: { data: UserSerializer.new(@user, scope: @user).attributes,code:1,success: true,message:"registration Successful" }
    else
      render json: {success: false, code: 0 , data: '' , code:0,message: @user.errors.full_messages*', '}, status: :unprocessable_entity
    end
  end

private

def sign_up_params
params.require(:user).permit(:name,:username,:email,:password,:password_confirmation)

end

def account_update_params
params.require(:user).permit(:name,:username,:email,:password,:password_confirmation,:present_password)
end





end
