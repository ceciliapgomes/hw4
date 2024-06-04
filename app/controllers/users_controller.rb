def create
  @user = User.new(user_params)
  @user.password_digest = BCrypt::Password.create(params[:user][:password])
  if @user.save
    session[:user_id] = @user.id
    redirect_to places_path, notice: 'Account created successfully!'
  else
    render :new
  end
end

private

def user_params
  params.require(:user).permit(:name, :email, :password)
end
