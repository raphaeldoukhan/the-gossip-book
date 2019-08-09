class ApplicationController < ActionController::Base
  def current_user
    User.find_by(id: session[:user_id])
  end  

  def ensure_no_current_user
    if current_user
      flash[:notice] = "Vous êtes déjà connecté"
      redirect_to root_url
      false
    end 
  end

  def logged_in_user
    unless logged_in?
        flash[:danger] = "Connectez-vous"
        redirect_to new_session_path
    end
  end

  def logged_in?
    !current_user.nil?
  end
  
end
