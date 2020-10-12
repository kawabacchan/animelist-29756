class List < ApplicationRecord
  belongs_to :user
  has_many :animes, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :public

  validates :name, presence: true, length: { maximum: 20 }
  validates :public, presence: true
  validates :public_id, numericality: { other_than: 1 }
end
