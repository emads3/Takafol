class DonorsCase < ApplicationRecord
    belongs_to :donor
    belongs_to :case
end
