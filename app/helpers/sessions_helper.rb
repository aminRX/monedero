module SessionsHelper
  def sign_in(user)
    cookies.permanent[:auth_token] = user.auth_token
  end

  def current_user
    @current_user ||= User.find_by_auth_token cookies[:auth_token]
  end

  def sign_in?
    @user = User.find_by_auth_token(cookies[:auth_token])
  end

  def sign_out
   cookies.delete :auth_token
  end

  def is_admin?

  end

  def is_branch_office?

  end

  def login
    if !sign_in?
      redirect_to sign_in_path
    end
  end

end
