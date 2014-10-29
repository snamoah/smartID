class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render plain: "You have successfully signed up"

    else
      render plain: "Registration Error"
    end
  end

  private def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :username, :password, :gender)
  end

end


