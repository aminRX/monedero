class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save && is_admin?
      flash[:user_created] = "Usuario creado"
      redirect_to user_path(@user.id)
    else
      flash[:user_not_created] = "El usuario no pudo crearse"
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:userid, :password)
  end
end
