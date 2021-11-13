class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :Kanji_last_name,    presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :Kanji_first_name,   presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :Kana_last_name,     presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :Kana_first_name,    presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birthday,           presence: true
  validates :encrypted_password,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}

  #has_many :items
  #has_many :buy_records
end
