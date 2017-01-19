module SessionsHelper
  def sign_in(user)
    cookies.permanent[:auth_token] = user.auth_token
  end

  def current_user
    @current_user ||= User.find_by_auth_token cookies[:auth_token]
  end
end
