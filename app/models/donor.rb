class Donor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :national_id, uniqueness: true
         has_many :donors_cases
         has_many :cases, through: :donors_cases
end
