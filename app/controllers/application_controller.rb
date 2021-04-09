class ApplicationController < ActionController::Base
  private

  def authenticate_user!
    authenticate_admin!
    redirect_to new_admin_session_path if !current_admin.confirmed
  end
end
