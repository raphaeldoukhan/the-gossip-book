module ApplicationHelper
  def current_user
    User.find_by(id: session[:user_id])
  end
 
  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_user?(event_user)
    current_user == event_user
  end

# Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to new_session_path
    end
  end
  
  def liked?(gossip_id)
    if !current_user.nil?
    !current_user.likes.where(likeable_type: "Gossip", likeable_id: gossip_id).blank?
    end
  end
end
