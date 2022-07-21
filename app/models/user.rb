class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products

  with_options presence: true do
    validates :nickname
    validates :birth_date
  end

  validates :family_name, presence: true,
                          format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.', allow_blank: true }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.', allow_blank: true }
  validates :family_name_reading, presence: true,
                                  format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.', allow_blank: true }
  validates :first_name_reading, presence: true,
                                 format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.', allow_blank: true }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Input half-width characters' }
end
