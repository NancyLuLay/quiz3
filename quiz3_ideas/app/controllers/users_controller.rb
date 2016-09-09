class UsersController < ApplicationController

  def new
    @user = User.new
    # @user.avatar = params[:file] # Assign a file like this, or
    #
    # @user.save!
    # @user.avatar.url # => '/url/to/file.png'
    # @user.avatar.current_path # => 'path/to/file.png'
    # @user.avatar_identifier # => 'file.png'
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thanks for signing up"
    else
      flash[:alert] = "Fix errors below"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end

end
