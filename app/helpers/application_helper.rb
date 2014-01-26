module ApplicationHelper
	def current_user
		@current_user ||= User.find_by_session_token(session[:session_token])
	end

	def login!(user)
		user.reset_session_token
		user.save!
		session[:session_token] = user.session_token
	end

	def logout!
		user = current_user
		user.reset_session_token
		user.save!
		@current_user = nil
		session[:session_token] = nil
	end

end
