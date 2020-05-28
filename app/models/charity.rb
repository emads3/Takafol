class Charity < ApplicationRecord
    has_many :charity_cases
    has_many :cases through: :charities_cases
end
