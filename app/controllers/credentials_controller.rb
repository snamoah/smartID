class CredentialsController < ApplicationController

  layout 'dasboard'

  def index
    @user =  User.find(params[:user_id])
    @credentials = @user.credentials
  end

  def edit
    @user = User.find(params[:user_id]);
    @credential = @user.credentials.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id]);
    @credential = @user.credentials.find(params[:id])

    if @credential.update(credential_params)
      redirect_to user_credentials_path(@user)
    else
      render 'edit'
    end

  end

  def new
    @user = User.find(params[:user_id])
    @credential = @user.credentials.new
  end

  def create
    @user = User.find(params[:user_id])
    @credential = @user.credentials.new(credential_params)
    
    if @credential.save
      redirect_to user_credentials_path(@user), notice: 'Updated succesfully'
    else
      render 'new', notice: 'Enter valid credential information'
    end
  end


  def destroy
    @user = User.find(params[:user_id])
    @user.credentials.find(params[:id]).destroy

    redirect_to user_credentials_path(@user)
  end

  private
  def credential_params
    params.require(:credential).permit(:name, :number)
  end
end
