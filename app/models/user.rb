class User < ActiveRecord::Base
  
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  # Name Validation
  validates :name, presence: true, length: { maximum: 50 }

  # E-Mail Validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  # Password Validation
  #   There's a seperate validation for update to allow for the password
  #   to be left unchanged.
  has_secure_password
  validates :password, presence: true,
                       confirmation: true,
                       length: { minimum: 6 },
                       on: :create
  validates :password, confirmation: true,
                       length: { minimum: 6 },
                       allow_blank: true,
                       on: :update
  
  has_many :marks
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private
  
  def create_remember_token
    self.remember_token = User.hash(User.new_remember_token)
  end
end
