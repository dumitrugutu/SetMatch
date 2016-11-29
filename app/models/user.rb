class User < ApplicationRecord
  has_many :posts

  before_save { self.email = email.downcase }
  validates :fullname, presence: "must be present", uniqueness: true,
                       length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: "must be present", length: { maximum: 255 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password, presence: "must be present", length: { minimum: 6 }

  # for paperclip
  has_attached_file :image, styles: { medium: "300x300", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
