class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  has_secure_password

  before_save { self.email = email.downcase }
  validates :fullname, presence: "must be present", length: { maximum: 100 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: "must be present", length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

  # Allow_nil won't require to re-type the password when updating the profile
  validates :password, presence: "must be provided", length: { minimum: 6 }, allow_nil: true
  validates :screen_name, presence: "must be provided", length: { maximum: 50 }
  validates :bio, presence: "must be provided", length: { maximum: 255 }
  validates :rating, presence: "must be provided", numericality: { only_integer: true }
  validates :zipcode, presence: "must be provided", numericality: { only_integer: true }, length: { maximum: 10 }
  validates :age, presence: "must be provided", numericality: { only_integer: true }, length: { maximum: 3 }
  validates :gender, presence: "must be provided"
  validates :handed, presence: "must be provide"

  # for paperclip
  has_attached_file :image, styles: { medium: "300x300", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
