class UsersController < ApplicationController
  layout 'dasboard', only: :show
  def new
    @user = User.new
  end

  def create
    @user = User.new(firstname: params[:firstname], lastname: params[:lastname], username: params[:username], password: params[:password], gender: params[:gender], email: params[:email])

    if @user.save
      redirect_to new_user_credential_path(@user)

    else
      render plain: "Registration Error"
    end
  end

  def login
    @user = User.new
  end

  def show
    @user =  User.find(params[:id])
    @credentials = @user.credentials
  end

  def validate
    @user = User.find_by username: params[:username], password: params[:password]
    if @user.blank?
      redirect_to root_url
    else
      redirect_to user_path(@user)
    end
  end

  private 
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :username, :password, :gender)
  end

end


