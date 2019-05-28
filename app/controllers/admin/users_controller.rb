class Admin::UsersController < ApplicationController
  # before_action :require_admin

  # GET /admin/users
  # GET /admin/users.json
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json { render json: { "status": "SUCCESS", "data": @users } }
    end
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: { "status": "SUCCESS", "data": @user } }
    end
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
      respond_to do |format|
        format.html {
          redirect_to admin_users_path, notice: "Register new user : #{@user.name}."
        }
        format.json {
          render json: {
              "status": "SUCCESS",
              "message": "Register new user : #{@user.name}.",
              "data": @user
          }
        }
      end
    else
      respond_to do |format|
        format.html {
          flash[:danger] = "Error : Failed to create user."
          render :new
        }
        format.json {
          render json: {
              "status": "ERROR",
              "message": "ERROR : Failed to create user.",
              "data": { "error": "Fail" }
          }
        }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to admin_user_path(@user), notice: "updated user data: #{@user.name}." }
        format.json {
          render json: {
              "status": "success",
              "message": "updated user data : #{@user.name}.",
              "data": @user
          }
        }
      end
    else
      respond_to do |format|
        format.html {
          flash[:danger] = "Error : Failed to update user."
          render :new
        }
        format.json {
          render json: {
              "status": "ERROR",
              "message": "ERROR : Failed to update user.",
              "data": { "error": "Fail" }
          }
        }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy

    @user = User.find(params[:id])
    if @user.destroy
      respond_to do |format|
        format.html { redirect_to admin_user_url, notice: "User@#{@user.name} was successfully destroyed." }
        format.json {
          render json: {
              "status": "SUCCESS",
              "message": "deleted user data : #{@user.name}.",
              "data": @user
          }
        }
      end
    else
      respond_to do |format|
        format.html {
          flash[:danger] = "Error : Failed to delete user."
          render :index
        }
        format.json {
          render json: {
              "status": "ERROR",
              "message": "ERROR : Failed to update user.",
              "data": { "error": "Fail" }
          }
        }
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
    end

    def require_admin
      redirect_to root_path, flash: { danger: 'You are not administrators!' } unless current_user.admin?
    end
end
