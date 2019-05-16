class SessionsController < ApplicationController

  # GET /sessions/new
  def new
  end

  # POST /sessions
  # POST /sessions.json
  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, flash: { success: 'Successfully login!' }
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    reset_session
    redirect_to root_path, notice: 'successfully logout'
  end

  private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
