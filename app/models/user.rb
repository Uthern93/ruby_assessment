class User < ApplicationRecord
    has_secure_password
    has_many :blogs
    has_many :comments
  
    validates :email, presence: true, uniqueness: true, format: { 
      with: /\A[^@\s]+@[^@\s]+\.[a-zA-Z]+\z/, 
      message: "must be a valid email address format" 
    }

    validates :password, presence: true, length: { minimum: 8 }, format: { 
      with: /\A(?=.*\d)[a-zA-Z\d]+\z/, 
      message: "must be at least 8 characters long and include at least one number" 
    }, if: -> { new_record? || !password.nil? }
end
  