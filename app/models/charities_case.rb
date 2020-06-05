class CharitiesCase < ApplicationRecord
    belongs_to :charity
    belongs_to :case
    accepts_nested_attributes_for :charity, :case

end
