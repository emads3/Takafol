class CaseDoner < ApplicationRecord
    belongs_to :cases
    belongs_to :doners
end
