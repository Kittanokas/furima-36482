class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :kanji_last_name, presence: true
  validates :kanji_first_name, presence: true
  validates :kana_last_name, presence: true
  validates :kana_last_name, presence: true
  validates :birthday, presence: true
  validates :encrypted_password, presence: true

  has_many :items
  has_many :buy_records

end
