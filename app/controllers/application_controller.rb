class ApplicationController < ActionController::Base
  protect_from_forgery

  def this_week
    DateTime.now.beginning_of_week.strftime("%Y-%m-%d")..DateTime.now.end_of_week.strftime("%Y-%m-%d")
  end

end
