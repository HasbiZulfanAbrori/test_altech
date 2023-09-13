class User < ApplicationRecord
    validates :username, presence: true
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, presence: true, length: { minimum: 8 }
    
    def new_attr
        id:,
        email:,
        username:
    end
    
end
