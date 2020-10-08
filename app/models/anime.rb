class Anime < ApplicationRecord
  belongs_to :list

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  validates :name, presence: true, length {max: 40}
  validates :genre, presence: true
  validates :score, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}

end
