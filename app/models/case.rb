class Case < ApplicationRecord

    validates :priority, :inclusion => { :in => 1..5 } , allow_nil: true
    validates :national_id, uniqueness: true

    #charity&case relation
    has_many :charities_cases
    has_many :charities, through: :charities_cases
    accepts_nested_attributes_for :charities


    # doner&case relation
    has_many :donors_cases
    has_many :donors, through: :donors_cases
end
