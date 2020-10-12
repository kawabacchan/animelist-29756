class Anime < ApplicationRecord
  belongs_to :list
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  validates :name, presence: true, length: { maximum: 40 }
  validates :genre, presence: true
  validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, if: :score?

  private

  def score?
    score.present?
  end
end
