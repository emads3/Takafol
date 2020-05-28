class Case < ApplicationRecord
    validates :priority, :inclusion => { :in => 1..5 }
    validates :national_id, uniqueness: true
    has_many :charity_cases
    has_many :charities, through: :charity_cases
end
