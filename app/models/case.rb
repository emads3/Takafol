class Case < ApplicationRecord
    validates :priority, :inclusion => { :in => 1..5 }
    validates :national_id, uniqueness: true

    # charity&case relation
    has_many :charity_cases
    has_many :charities, through: :charity_cases

    # doner&case relation
    has_many :case_doners
    has_many :doners, through: :case_doners
end
