class Liquor < ApplicationRecord
    has_many :liquor_coctels
    has_many :coctels, through: :liquor_coctels

    has_many :liquor_formularios
    has_many :formularios, through: :liquor_formularios
end
