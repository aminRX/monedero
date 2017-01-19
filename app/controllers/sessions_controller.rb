class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_userid session_params[:userid]
    if @user && @user.authenticate(session_params[:password])
      sign_in @user
      flash[:joined] = 'Bienvenido'
      redirect_to sign_in_path
    else
      flash[:error] =  "Incorrecto Email / Password"
      redirect_to sign_in_path
    end
  end

  def destroy
  end

  private

  def session_params
    params.require(:sessions).permit(:userid, :password)
  end
end
