class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :lists
  has_many :follows

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sex

  validates :nickname, presence: true, length: {maximum: 10}
  validates :birthday, presence: true
  validates :sex_id, presence: true, numericality: {other_than: 1}

  generate_public_uid

end
