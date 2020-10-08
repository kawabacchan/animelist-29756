class List < ApplicationRecord

  belongs_to :user

  validates :name, presence: true, length: { maximum: 20}
  validates :public_id, numericality: {other_than: 1}
end
