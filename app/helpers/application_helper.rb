module ApplicationHelper

  def is_admin?
    cookies[:user] == "gregory@culturecreates.com"
  end
end
