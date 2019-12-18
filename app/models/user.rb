class User < ActiveRecord::Base

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    User.find_by(email: email.strip.downcase).try(:authenticate, password) || nil
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, presence: true 

  private
  
  before_save :remove_whitespace, :to_lower_case  

    def remove_whitespace
      email.strip
    end

    def to_lower_case
      email.downcase
    end



end