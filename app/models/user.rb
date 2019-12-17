class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, presence: true 


  def authenticate_with_credentials(email, password)
    User.find_by(email: email).try(:authenticate, password)
  end

end