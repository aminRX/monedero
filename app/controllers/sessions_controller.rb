class SessionsController < ApplicationController
  def new
    if sign_in?
      redirect_to '/'
    end
  end

  def create
    @user = User.find_by_userid session_params[:userid]
    if @user && @user.authenticate(session_params[:password])
      sign_in @user
      flash[:joined] = 'Bienvenido'
      redirect_to sign_in_path
    else
      flash[:error] =  "Incorrecto UserId / Password"
      redirect_to sign_in_path
    end
  end

  def destroy
    sign_out
    redirect_to sign_in_path
  end

  private

  def session_params
    params.require(:sessions).permit(:userid, :password)
  end
end
