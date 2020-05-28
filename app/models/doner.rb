class Doner < ApplicationRecord
    validates :national_id, uniqueness: true
    has_many :case_doners
    has_many :cases, through: :case_doners
end
