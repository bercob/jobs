class UserSessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:user][:email], params[:user][:password])
      redirect_back_or_to(:users, notice: t('login_ok'))
    else
      flash.now[:alert] = t('login_nok')
      redirect_to :login, alert: 'Login failed'
    end
  end

  def destroy
    logout
    redirect_to(:static_pages_home, notice: t('logout_ok'))
  end

end
