module ApplicationHelper
  def set_return
    session[:return_to] ||= request.referer
  end
end
