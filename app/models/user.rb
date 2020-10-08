class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sex

  validates :nickname, presence: true, length: {maximum: 10}
  validates :birthday, presence: true
  validates :sex_id, presence: true, numericality: {other_than: 1}

end
