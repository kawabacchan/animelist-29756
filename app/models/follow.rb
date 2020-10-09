class Follow < ApplicationRecord
  belongs_to :user

  validates :friend_id, presence: true
end
