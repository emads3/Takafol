class City < ApplicationRecord
  belongs_to :governate
  has_many :cases
end
