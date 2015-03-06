class SessionsController < Devise::SessionsController

  def new
    @users = User.all
    render layout: false
  end

  def create
    @user = User.find_by_email_and_role(params[:user][:email],params[:user][:role])
    respond_to do |format|
      format.js
    end
  end


end
