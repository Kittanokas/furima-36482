class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :nickname,           presence: true
  validates :Kanji_last_name,    presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :Kanji_first_name,   presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :Kana_last_name,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :Kana_first_name,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday,           presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  has_many :items
  has_many :orders
  has_many :comments
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create

    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
