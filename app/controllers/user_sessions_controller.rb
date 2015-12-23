class UserSessionsController < ApplicationController
  before_action :require_login, only: [:destroy]
  def new
    @user = User.new
    if params.has_key?('user_sessions')
      @email = params[:user_sessions][:email]
    end
  end

  def create
    if @user = login(params[:user_sessions][:email], params[:user_sessions][:password])
      redirect_back_or_to(:users, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      @email = params[:user_sessions][:email]
      render action: 'new'
      #redirect_to new_user_session_path(email: params[:email]), alert: 'Login failed'
    end
  end

  def destroy
    logout
    redirect_to(:static_pages_home, notice: 'Logged out!')
  end

end
