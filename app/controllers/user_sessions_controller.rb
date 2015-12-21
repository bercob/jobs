class UserSessionsController < ApplicationController
  before_action :require_login, only: [:destroy]
  def new
    @user = User.new
    @email = params[:email]
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:users, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      @email = params[:email]
      render action: 'new'
      #redirect_to new_user_session_path(email: params[:email]), alert: 'Login failed'
    end
  end

  def destroy
    logout
    redirect_to(:welcome_index, notice: 'Logged out!')
  end

end
