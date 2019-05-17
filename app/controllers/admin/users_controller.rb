class Admin::UsersController < ApplicationController
  before_action :require_admin

  # GET /admin/users
  # GET /admin/users.json
  def index
    @users = User.all
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /admin/users/new
  def new
    @user = User.new
  end

  # GET /admin/users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "Register new user : #{@user.name}."
    else
      flash[:danger] = "Error : Failed to create user."
      render :new
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "Updated user data: #{@user.name}."
    else
      flash[:danger] = "Error : Failed to update user."
      render :new
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_user_url, notice: "User was successfully destroyed."
    else
      flash[:danger] = "Error : Failed to delete user."
      render :index
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
    end

  def require_admin
    redirect_to root_path unless current_user.admin?
  end
end
