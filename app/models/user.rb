class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,20}+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  with_options presence: true do
    validates :nickname, length: { maximum: 40 }
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_kata
      validates :last_kata
    end
  end

  has_many :items
  has_many :purchase_records
end
