class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!

  validates :email, :password, :user_name, presence: true
  validates :user_name, :email, uniqueness: true

  has_many :airmaps

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(email, password)
    user = User.find_by(email: email)
    if user && self.password == password
      true
    else
      false
    end
  end

end
