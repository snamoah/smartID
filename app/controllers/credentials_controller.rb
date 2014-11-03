class CredentialsController < ApplicationController
  def index
    @credentials = Credential.where params[:user_id]

    if @credentials.blank?
      redirect_to new_user_credential_path(params[:user_id])
    end
  end

  def new
    @user = Credential.find_by(params[:user_id]).user
  end

  def create
    render plain: "Created"
  end
end
