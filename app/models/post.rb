class Post < ApplicationRecord
  belongs_to :author, { class_name: 'User', foreign_key: :user_id }

  scope :sorted, lambda { order('created_at DESC')}
end
