class CredentialsController < ApplicationController

  layout 'dasboard'

  def new
    @user = User.find(params[:user_id])
    @credential = @user.credentials.new
  end

  def create
    @user = User.find(params[:user_id])
    @credential = @user.credentials.new(credential_params)
    
    if @credential.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private
  def credential_params
    params.require(:credential).permit(:name, :number)
  end
end
