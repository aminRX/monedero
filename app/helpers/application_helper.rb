module ApplicationHelper
  include SessionsHelper

  def current_branch_office
    current_user.branch_office
  end
end
