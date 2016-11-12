class User < ApplicationRecord
  has_many :posts

  has_secure_password

  validates :fullname, presence: "must be present", uniqueness: true
  validates :email, presence: "must be present", uniqueness: true
  validates :password, presence: "must be present"
end
