class Liquor < ApplicationRecord
    has_many :liquor_coctels
    has_many :coctels, through: :liquor_coctels
end
