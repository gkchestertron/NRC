class User < ActiveRecord::Base
  attr_accessible :email, :password

  attr_accessor :password
  before_validation :reset_session_token, on: :create
  validates :email, :session_token, :password_digest, presence: true


  def self.find_by_credentials(email, pass)
  	user = User.find_by_email(email)
  	if user && user.is_password?(pass)
  		return user
  	else
  		return nil
  	end
  end

  def password=(pass)
		self.password_digest = BCrypt::Password.create(pass)  	
  end

  def is_password?(pass)
  	BCrypt::Password.new(self.password_digest).is_password?(pass)
  end

  def reset_session_token
  	self.session_token = SecureRandom::urlsafe_base64(16)
  end

end
