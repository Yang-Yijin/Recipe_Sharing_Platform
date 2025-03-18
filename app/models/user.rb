class User < ApplicationRecord
  has_secure_password

  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_recipes, through: :favorites, source: :recipe

  validates :email, presence: { message: "Email cannot be blank" },
          uniqueness: { message: "Email is already taken" },
          format: { with: URI::MailTo::EMAIL_REGEXP, message: "Email format is invalid" }

  validates :username, presence: { message: "Username cannot be blank" },
          uniqueness: { message: "Username is already taken" },
          length: { minimum: 3, maximum: 25, message: "Username must be between 3-25 characters" }
end
