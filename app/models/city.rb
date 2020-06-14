class City < ApplicationRecord
  belongs_to :governorate
  has_many :cases
end
