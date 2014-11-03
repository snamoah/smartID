class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_credential_path(@user)

    else
      render plain: "Registration Error"
    end
  end

  def login
    @user = User.new
  end

  def validate
    render plain: params[:username]
  end

  private 
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :username, :password, :gender)
  end

end


