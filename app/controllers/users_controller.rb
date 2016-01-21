class UsersController < ApplicationController
  before_action :require_login
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:new, :create, :destroy]
  before_action :require_admin_except_own_data, only: [:edit, :update]
  before_action :set_languages, only: [:new, :edit, :create, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: t('user.created') }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: t('user.updated') }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: t('user.destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_languages
      @languages = Language.order('name asc').all
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      if current_user.admin?
        params.require(:user).permit(:email, :password, :password_confirmation, :degree_id, { :language_ids => [] }, :admin)
      else
        params.require(:user).permit(:email, :password, :password_confirmation, :degree_id, { :language_ids => [] })
      end
    end

    def require_admin
      unless current_user.admin?
        redirect_back_or_to :users, alert: t('admin_needed')
      end
    end

    def require_admin_except_own_data
      require_admin if @user.id != current_user.id
    end
end
