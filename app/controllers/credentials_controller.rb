class CredentialsController < ApplicationController
 
  def new
    @user = User.find(params[:user_id])
    @credential = @user.credentials.new
  end

  def create
    @user = User.find(params[:user_id])
    @credential = @user.credentials.new
    @credential.name = params[:name]
    @credential.number = params[:number]

    if @credential.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
end
