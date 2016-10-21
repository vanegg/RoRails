class User < ApplicationRecord

  include BCrypt

  has_many :questions
  has_many :answers
  has_many :votes

  # validates :name, :email, :password_digest, presence: true
  #validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

  # def password
  #   @password ||= Password.new(password_digest)
  # end

  # def password=(user_password)
  #   @password = Password.create(user_password)
  #   self.password_digest = @password
  # end

  def self.authenticate(name, user_password)
    if User.exists?(name: name)
      user = User.find_by(name: name)
      if user && (user.password == user_password)
        return user
      else
        nil
      end
    else
      nil
    end
  end

end
